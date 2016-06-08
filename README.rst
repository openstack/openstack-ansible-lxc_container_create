OpenStack-Ansible LXC container create
######################################

Ansible role for creating LXC containers. This role will create several
directories on the LXC host for use in bind mounted storage within the
container.

Default Variables
=================

.. literalinclude:: ../../defaults/main.yml
   :language: yaml
   :start-after: under the License.

Required Variables
==================

None


Example Playbook
================

.. code-block:: yaml

    - name: Create container(s)
      hosts: all_containers
      gather_facts: false
      user: root
      roles:
        - { role: "lxc_container_create" }

