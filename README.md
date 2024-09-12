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
ansible-playbook local.yml --ask-become-pass --ask-vault-pass
```

##  Documentations
* [Bash Shortcuts](./doc/01.bash_shortcuts_v2.md)
