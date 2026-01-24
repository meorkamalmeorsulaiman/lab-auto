#!/bin/bash

ssh-keygen -f '/home/ansible/.ssh/known_hosts' -R '192.168.101.10'
ssh-keygen -f '/home/ansible/.ssh/known_hosts' -R '192.168.101.11'
ssh-keygen -f '/home/ansible/.ssh/known_hosts' -R '192.168.101.12'
ssh-keygen -f '/home/ansible/.ssh/known_hosts' -R '192.168.101.13'
ssh-keygen -f '/home/ansible/.ssh/known_hosts' -R '192.168.101.21'
ssh-keygen -f '/home/ansible/.ssh/known_hosts' -R '192.168.101.22'
ssh-keygen -f '/home/ansible/.ssh/known_hosts' -R '192.168.101.23'
