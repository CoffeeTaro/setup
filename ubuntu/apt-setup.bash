#!/bin/bash
bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install manpages-ja
sudo apt-get install git -y
sudo apt-get install nmap -y
sudo apt-get install nkf -y
# MeCab
sudo apt-get install mecab libmecab-dev mecab-ipadic-utf8 -y

# editor
sudo apt-get install vim -y
sudo apt-get install emacs -y

# set .vimrc in home directory
cp ./.vimrc ~/

# ssh
sudo apt-get install openssh-server -y

# offline install and update
sudo apt install apt-offline -y

# vnc
sudo apt-get install vnc4server -y
sudo apt-get install xfce4 xfce4-goodies -y

# apache
sudo apt-get install install apache2 -y

# kvm
sudo apt-get -y install qemu-kvm libvirt-bin virtinst bridge-utils -y
sudo modprobe vhost_net

# munin
sudo apt-get -y munin munin-node

# python
./pysetup.bash

# ------------------
# The programs below need your response

# MeCab-NEologd
./install_MeCab-NEologd.bash

# wireshark
sudo apt-get install wireshark -y
