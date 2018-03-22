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

Add these variables to set up cluster:

```
---
# set up cluster
setup_cluster: yes

# set up cluster through this node
master_ip: 10.240.0.5
master_port: 7000

# all nodes except the master node above
cluster_nodes:
- { node_ip: 10.240.0.12, node_port: 7000}
- { node_ip: 10.240.0.17, node_port: 7000}
- { node_ip: 10.240.0.12, node_port: 7001}
- { node_ip: 10.240.0.17, node_port: 7001}
- { node_ip: 10.240.0.5, node_port: 7001}

# assign hash slots to each master node
cluster_slots:
- { ip: 10.240.0.12, port: 7000, from: 0, to: 5400}
- { ip: 10.240.0.17, port: 7000, from: 5401, to: 10800}
- { ip: 10.240.0.5, port: 7000, from: 10801, to: 16383}

masters:
- {ip: 10.240.0.12, port: 7000}
- {ip: 10.240.0.17, port: 7000}
- {ip: 10.240.0.5, port: 7000}

# assign slave nodes to their master nodes
slaves:
- {ip: 10.240.0.17, port: 7001, master_ip: 10.240.0.12, master_port: 7000}
- {ip: 10.240.0.5, port: 7001, master_ip: 10.240.0.17, master_port: 7000}
- {ip: 10.240.0.12, port: 7001, master_ip: 10.240.0.5, master_port: 7000}
```


Dependencies
------------

#NA

Example Playbook
----------------
Please refer `tests` directory and `test.sh` file:
```
- hosts: test_server
  become: true
  become_user: root
  become_method: sudo
  serial:
    "100%"
  roles:
    - ../ansible-role-redis
```

License
-------

BSD

Author Information
------------------
Tran Duy Viet (Viet Tran)
tdviet12@gmail.com
