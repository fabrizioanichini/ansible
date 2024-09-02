# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages, including sudo and Ansible
RUN apt-get update && \
    apt-get install -y sudo software-properties-common && \
    add-apt-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible curl git python3 python3-pip && \
    apt-get clean

# Create a non-root user with sudo privileges
RUN useradd -ms /bin/bash ansibleuser && echo "ansibleuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set the working directory
WORKDIR /home/ansibleuser

# Copy the Ansible playbook into the container
COPY ansible-playbook.yml /home/ansibleuser/ansible-playbook.yml

# Set ownership of the home directory
RUN chown -R ansibleuser:ansibleuser /home/ansibleuser

# Switch to the non-root user
USER ansibleuser

# Start with Bash
CMD ["/bin/bash"]