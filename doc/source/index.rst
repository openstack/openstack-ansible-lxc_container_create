Example Index for role  docs
============================

Role to create LXC containers. This role can be used to configure
multiple networks within a container and do specific container
tuning.


Basic Role Example
^^^^^^^^^^^^^^^^^^

.. code-block:: yaml

    - role: "lxc_container_create"
      lxc_container_backing_store: dir
