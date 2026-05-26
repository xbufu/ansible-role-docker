# Ansible Role: Docker

An Ansible role to install Docker and Docker Compose on Debian/Ubuntu-based Linux distributions. Optionally mounts an NFS share, logs into a Docker registry, and deploys a Komodo Periphery agent.

## Requirements

- `ansible.posix` collection (for NFS mount)
- `community.docker` collection (for registry login)

## Role Variables

### Docker Users

Users to add to the `docker` group. Defaults to the current Ansible user.

```yml
docker_users:
  - "{{ ansible_user }}"
```

### NFS Mount

Mount an NFS share before Docker starts (e.g. for storing Docker data on a NAS).

```yml
nfs_mount: false
nfs_src: ""                  # e.g. 192.168.99.1:/mnt/tank/data/docker/devops/app-srv
nfs_mount_path: /mnt/docker
nfs_opts: vers=4
```

### Docker Registry Login

Log into a Docker registry using an API key or token.

```yml
docker_registry_login: false
docker_registry_url: "https://index.docker.io/v1/"
docker_registry_username: ""
docker_registry_api_key: ""
```

### Komodo Periphery Agent

Install and configure the [Komodo](https://github.com/moghtech/komodo) Periphery agent as a systemd service.

```yml
periphery_agent: true
periphery_root_dir: /mnt/docker/periphery
```

The config template is located at `templates/periphery.config.toml.tpl`. Customize it before running the role.

## Dependencies

None.

## Example Playbook

```yml
- hosts: servers
  roles:
    - role: xbufu.docker
      vars:
        docker_users:
          - bufu
        nfs_mount: true
        nfs_src: "192.168.99.1:/mnt/tank/data/docker/devops/app-srv"
        docker_registry_login: true
        docker_registry_username: myuser
        docker_registry_api_key: "{{ vault_registry_api_key }}"
        periphery_agent: true
        periphery_root_dir: /mnt/docker/periphery
```

## License

MIT

## Author

Created by [xbufu](https://github.com/xbufu).
