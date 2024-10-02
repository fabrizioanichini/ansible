# Ansible quick start

This repository provides an environment to test and run Ansible playbooks on an Ubuntu system. The primary goal is to facilitate easy editing and execution of Ansible playbooks on your local system. Additionally, it includes a Docker-based environment for further development and isolated testing.

## Setup and Usage

Follow these steps to set up and use the Docker environment:

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd <your-repository-directory>
```
### 2. Prepare the Installation script

```bash
chmod +x ansible-install.sh
```

### 3. Run installation script

```bash
./ansible-install.sh
```
This will install Ansibile and its dependencies on the Ubuntu system.


### 4. Run Ansible playbook

```bash
ansible-playbook local.yml  -e "env_type=wsl-ubuntu" --ask-vault-pass --ask-become-pass
```
the type can either be wsl-ubuntu or fedora.

## Utilities

You may want to  exclude the docker mounting for testing

```bash
ansible-playbook local.yml --ask-vault-pass --ask-become-pass --skip-tags "docker-build"
```

##  Documentations
* [Bash Shortcuts](./doc/bash_shortcuts.md)
* [Vim Cheatsheet](./doc/vim_cht.md)
* [Tmux Cheatsheet](./doc/tmux_cht.md)
