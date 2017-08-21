#!/bin/bash
sudo yum update -y

# add repository
sudo yum -y install yum-plugin-priorities
sudo sed -i -e "s/\]$/\]\npriority=1/g" /etc/yum.repos.d/CentOS-Base.repo
# EPEL
sudo yum -y install epel-release
sudo sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/epel.repo
# CentOS SCLo Software collections 
sudo yum -y install centos-release-scl-rh centos-release-scl
sudo sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-SCLo-scl.repo
sudo sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo
# Remi
sudo yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/remi-safe.repo

sudo yum update -y
sudo yum install curl -y
sudo yum install -y wget
sudo yum install nmap -y
sudo yum install vim -y
sudo yum install emacs -y
sudo yum install -y man-pages-ja
sudo yum --enablerepo=epel install munin munin-node -y
sudo yum --enablerepo=epel install nkf -y

# MeCab
sudo rpm -ivh http://packages.groonga.org/centos/groonga-release-1.1.0-1.noarch.rpm
sudo yum install -y mecab mecab-devel mecab-ipadic git make curl xz

# for Python
sudo yum -y groupinstall "Development Tools"
sudo yum -y install readline-devel zlib-devel bzip2-devel sqlite-devel openssl-devel libXext.x86_64 libSM.x86_64 libXrender.x86_64 gcc libffi-devel python-devel
sudo yum install -y tk.x86_64 tk-devel.x86_64 tkinter.x86_64

# pyenv install
./pyenv-install.bash

# Spark
sudo yum install java-1.8.0-openjdk -y
wget https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz

# ------------------
# The programs below need your response

# MeCab-NEologd
./install_MeCab-NEologd.bash
