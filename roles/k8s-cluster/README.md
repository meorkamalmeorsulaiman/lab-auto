Role Name
=========

This role deploy Kubernetes HA Cluster.

Requirements
------------

Hosts ubuntu and SSH enabled, role tested on ubuntu 24 sudo passwordless with user `ansible` required. 

### Generic `all.yml`

- Specify user that use to manage the remote host on `ansible_user` variable
```
<snippet>
ansible_user: USERNAME
```


### Hosts
- Groups:
  - k8s_nodes
    - All K8s nodes
  - k8s_controllers
    - All K8s control nodes
  - k8s_controllers_master
    - K8s control node that initialize the cluster (master)
  - k8s_controllers_slave
    - K8s control node that act as standby node (slave)
  - k8s_workers
    - All K8s worker nodes 


Role Variables
--------------

Variables that should be specified

### Group variables - `k8s_nodes.yml`
- Use to specify cluster wide settings:
  - Kubernetes version
  - Containerd version
  - Runc version

```
---
containerd_version: x.x.x
runc_version: x.x.x
k8s_version: x.x
```

### Host variables `HOSTNAME.yml`
- Use to specify:
  - Keepalived:
    - State
    - Priority
    - Interface name
    - VRRP Instance
  - HAProxy settings:
    - Name for frontend and backend section
    - List of backend serves
```
---
keepalived:
  - name: INSTANCE-NAME
    if_name: INTERFACE-NAME
    vip: X.X.X.X
    state: MASTER or SLAVE
    priority: [0 - 255]

haproxy:
  - name: NAME
    backend_servers: 
      - X.X.X.X
      - X.X.X.X
```


Dependencies
------------

None

Example Playbook
----------------

Example playbook to use this role

```
---
- name: Deploying Kubernetes HA Cluster
  hosts: k8s_nodes
  become: true
  gather_facts: false
  roles:
    - roles/k8s-cluster
```

Several playbooks included in this role
```
ansible@ANS-CTRL:~/lab-auto/roles/k8s-cluster/tasks$ ls
01-set-kernel.yml   03-install-kubetools.yml  05-initialize-cluster.yml  main.yml
02-install-cri.yml  04-setup-controller.yml   06-control-join.yml
```

`main.yml` run the individual playbooks

```
#SPDX-License-Identifier: MIT-0
---
# tasks file for k8s-cluster

- name: Setting up kernel
  include_tasks: '01-set-kernel.yml'

- name: Installing Container runtime
  include_tasks: '02-install-cri.yml'

- name: Installing Kubetools
  include_tasks: '03-install-kubetools.yml'

- name: Setting up controller
  include_tasks: '04-setup-controller.yml'
  when: 
    - "'k8s_controllers' in group_names"

- name: Initilize cluster on master node
  include_tasks: '05-initialize-cluster.yml'
  when: "'k8s_controllers_master' in group_names"

- name: Copy control join script to control nodes
  copy: 
    src: /tmp/control-join-command.sh 
    dest: /tmp
    mode: '0755'
  when: "'k8s_controllers_slave' in group_names"

- name: Copy worker join script to worker nodes 
  copy: 
    src: /tmp/worker-join-command.sh 
    dest: /tmp 
    mode: '0755'
  when: "'k8s_workers' in group_names"
```

Author Information
------------------

Meor Muhammad Kamal, 
Network engineer CCIE #69681
