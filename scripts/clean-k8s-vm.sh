#!/bin/bash

cd ~/lab-auto/
ansible-playbook playbook/delete-k8s-vm.yml 
ansible-playbook playbook/create-k8s-vm.yml
