#!/bin/bash

ansible-playbook tests/test.yml -i tests/inventory --private-key=[your_ssh_key]
