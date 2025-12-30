DNS Deployment
=========

This role is to deploy dns server using bind9. It support multiple forward zones

Requirements
------------

Role tested on bind9.18.39 on Ubuntu 24.04.2

Role Variables
--------------

Variables that should be specified

### Group variables - `dns.yml`
- Use to specify your zones:
  - Reverse 
  - Forward

### Host variables `x_x_x_com.yml`
- This should be zone specific variable
  - List out the record within the zone
  - Each domain has only one reverse zone


Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
