#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install manpages-ja -y
sudo apt-get install git -y
sudo apt-get install nmap -y
sudo apt-get install nkf -y
sudo apt install tree -y
# MeCab
sudo apt-get install mecab libmecab-dev mecab-ipadic-utf8 -y

# editor
sudo apt-get install vim -y
sudo apt-get install emacs -y

# set .vimrc in home directory
cp ./.vimrc ~/
# make directory for vim
mkdir -p ~/.vim/bundle
# get NeoBundle from repository
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# ssh
sudo apt-get install openssh-server -y

# offline install and update
sudo apt install apt-offline -y

# vnc
sudo apt-get install vnc4server -y
sudo apt-get install xfce4 xfce4-goodies -y

# apache
sudo apt-get install apache2 -y

# kvm
sudo apt-get install qemu-kvm libvirt-bin virtinst bridge-utils -y
sudo modprobe vhost_net

# munin
sudo apt-get install munin munin-node -y

# python
`pwd`/pysetup.bash

# ------------------
# The programs below need your response

# MeCab-NEologd
`pwd`/install_MeCab-NEologd.bash

# wireshark
sudo apt-get install wireshark -y
