#!/usr/bin/env bash
# Copyright 2016, Rackspace US, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -ev

# Execution example: lxc-veth-wiring.sh testing VETHTEST eth1 br-mgmt

# CLI variables
CONTAINER_NAME="${1}"
VETH="${2}"
INTERFACE="${3}"
BRIDGE="${4}"
VETH_PEER="$(openssl rand -hex 4)"

# PID of running container
PID="$(lxc-info -pHn ${CONTAINER_NAME})"

# Exit 0 means no change, exit 3 is changed, any other exit is fail.
EXIT_CODE=0

if ! ip a l "${VETH}";then
  ip link add name "${VETH}" type veth peer name "${VETH_PEER}"
  ip link set dev "${VETH}" up
  EXIT=3
else
  ip link set dev "${VETH}" up
fi

if ip a l "${VETH_PEER}";then
  ip link set dev "${VETH_PEER}" up
  ip link set dev "${VETH_PEER}" netns "${PID}" name "${INTERFACE}"
  EXIT=3
fi

if ! brctl show "${BRIDGE}" | grep -q "${VETH}"; then
  brctl addif "${BRIDGE}" "${VETH}"
  EXIT=3
fi

lxc-attach --name "${CONTAINER_NAME}" <<EOC
  ip link set dev "${INTERFACE}" up
  ifdown "${INTERFACE}"
  ifup "${INTERFACE}"
EOC

exit ${EXIT}
