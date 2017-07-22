#!/bin/bash

# Remove older version
sudo apt-get remove docker docker-engine docker.io

sudo apt-get update

# install package to allow apt to use a repository over HTTPS
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# set up stable repository
sudo add-apt-repository \
 "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) \
 stable"

# install docker CE
sudo apt-get update
sudo apt-get install docker-ce

# check
sudo docker run hello-world
# install
sudo docker run ubuntu
