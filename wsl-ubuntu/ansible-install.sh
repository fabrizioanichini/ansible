#!/usr/bin/env bash

## Update
sudo apt update

## Install ansible
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
