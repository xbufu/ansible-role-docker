Ansible Role: Docker
=========

An Ansible role to install Docker and Docker Compose on Linux distributions. Deploys Portainer Agent by default as well.

Requirements
------------

Python & Pip.

Role Variables
--------------

You can specify the users to add to the docker group and wether to deploy the Portainer agent or not. By default, it deploys the agent and adds the current user to the docker group.

```yml
docker_users:
  - "{{ ansible_env.SUDO_USER is defined | ternary(ansible_env.SUDO_USER, ansible_user) }}"
deploy_portainer_agent: True
```

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: servers
  roles:
      - role: xbufu.docker
        vars:
          docker_users:
            - bufu
            - user
          deploy_portainer_agent: True
```

License
-------

MIT / BSD

Author Information
------------------

Created by xbufu.
