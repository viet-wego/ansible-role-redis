Redis on Ubuntu
=========

Install Redis on Ubuntu server. Tested for Redis 3.2.11 on Ubuntu 14.04 LTS.

Requirements
------------

An Ubuntu server have a user with sudo permission.

Role Variables
--------------

Want to install other versions of Redis:
- Put your `redis_version` variable in `vars/main.yml`
- Add checksum for your version to `redis_checksums` in `vars/main.yml`
- Add config template to `template/[your version]/redis.conf.j2`


Dependencies
------------

#NA

Example Playbook
----------------
Please refer `tests` directory:
```
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
