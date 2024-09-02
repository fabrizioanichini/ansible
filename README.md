# Ansible Test Environment with Docker

This repository provides a Docker-based environment to test Ansible playbooks on a fresh Ubuntu installation. The environment is set up to easily edit and run Ansible playbooks repeatedly without affecting your host system.

## Prerequisites

Before you start, ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup and Usage

Follow these steps to set up and use the Docker environment:

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd <your-repository-directory>
```

### 2. Build and run Docker container

```bash
docker-compose up --build
```

### 3. Enter the container

```bash
docker exec -it ansible-ubuntu-test /bin/bash
```

### 4. Run Ansible playbook

```bash
ansible-playbook -i localhost, ansible-playbook.yml
```

## Remounting after changing the Ansible

### 1. Stop and Remove the Existing Container

```bash
docker-compose down
```

### 2. Rebuild

```bash
docker-compose up --build
```

### 3. Enter

```bash
docker exec -it ansible-ubuntu-test /bin/bash
```

