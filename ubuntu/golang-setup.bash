#!/bin/bash

# environment var for goenv 
echo '# Goenv'
echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.bashrc
echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(goenv init -)"' >> ~/.bashrc

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# set var for golang
export GOPATH=`echo $HOME`/go
echo 'export GOPATH=~/go' >> ~/.bashrc

# install golang for system
sudo apt install golang -y

# install goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv
goenv install 1.8.3

# install package manager
sudo apt install glide -y
