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
ansible-playbook local.yml --ask-vault-pass
```

## Further Development 

If you want to test or develop the Ansible playbooks in an isolated environment, you can use Docker. This section explains how to set up and use the Docker-based environment.

Before you start, ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)

### 1. Build Docker Container

```bash
docker build -t my-ansible-env .
```

### 2. Run the container

```bash
docker run -it -e USER=root -e HOME=/root my-ansible-env
```

### 3. Run Ansible playbook

```bash
ansible-playbook local.yml --ask-vault-pass
```
