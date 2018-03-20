#!/bin/bash

ansible-playbook tests/test.yml -i tests/inventory --private-key=~/.ssh/google_compute_engine