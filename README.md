# ansible-docker

Docker to run [Ansible](https://www.ansible.com/) CLI.

Images are available on https://hub.docker.com/r/progrhyme/ansible/ .

# Usage

```sh
docker run -it progrhyme/ansible COMMAND <ARGS...>

# Example
docker run -it progrhyme/ansible ansible-playbook --version
```

This runs `ansible-playbook` command through the container.

# Dependencies

- https://hub.docker.com/_/debian/

# Alternatives

- https://hub.docker.com/r/williamyeh/ansible/
- https://github.com/dockerfile/ansible

# License

The MIT License (MIT)

Copyright (c) 2017 IKEDA Kiyoshi
