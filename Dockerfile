FROM ubuntu:latest

ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt update && apt install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt update && apt install -y curl git ansible build-essential

# Copy the local files into the container
COPY . .

# Start a shell session instead of running the playbook automatically
CMD ["bash"]