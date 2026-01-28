#!/bin/bash

cd ~/lab-auto/
ansible-playbook playbook/delete-k8s-vm.yml 
ansible-playbook playbook/create-k8s-vm.yml
sleep 20
ansible-playbook playbook/deploy-k8s-cluster.yml
