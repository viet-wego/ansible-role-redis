#!/bin/bash


for i in {0..3275}; do redis-cli -h 10.240.0.9 -p 7000 CLUSTER ADDSLOTS $i; done


for i in {3276..6550}; do redis-cli -h 10.240.0.8 -p 7000 CLUSTER ADDSLOTS $i; done


for i in {6551..9830}; do redis-cli -h 10.240.0.13 -p 7000 CLUSTER ADDSLOTS $i; done


for i in {9831..13105}; do redis-cli -h 10.240.0.22 -p 7000 CLUSTER ADDSLOTS $i; done


for i in {13106..16383}; do redis-cli -h 10.240.0.33 -p 7000 CLUSTER ADDSLOTS $i; done