======================================
OpenStack-Ansible LXC container create
======================================

Ansible role for creating LXC containers. This role creates several
directories on the LXC host for use in bind-mounted storage within the
container.

Default variables
=================

.. literalinclude:: ../../defaults/main.yml
   :language: yaml
   :start-after: under the License.

Required variables
==================

None

Example playbook
~~~~~~~~~~~~~~~~

.. literalinclude:: ../../examples/playbook.yml
   :language: yaml
