Redis
=========

Install Redis on Ubuntu server. Tested for Redis 3.2.11 on Ubuntu 14.04 LTS.

Requirements
------------

An Ubuntu server have a user with sudo permission.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.


Dependencies
------------

#NA

Example Playbook
----------------
Please refer `tests` directory:
```
---
- hosts: test_server
  become: true
  become_user: root
  become_method: sudo
  serial:
    "100%"
  roles:
    - ../ansible-redis-role
```

License
-------

BSD

Author Information
------------------
Tran Duy Viet (Viet Tran)
tdviet12@gmail.com
