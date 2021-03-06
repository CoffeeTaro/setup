#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install libsqlite3-dev
sudo apt-get -y install libreadline6-dev
sudo apt-get -y install libgdbm-dev
sudo apt-get -y install zlib1g-dev
sudo apt-get -y install libbz2-dev
sudo apt-get -y install sqlite3
sudo apt-get -y install tk-dev
sudo apt-get -y install zip
sudo apt-get -y install gfortran
sudo apt-get -y install liblapack-dev
sudo apt-get -y install libssl-dev
sudo apt-get -y install libffi-dev
sudo apt-get -y install python-dev
sudo apt-get -y install python3-dev
sudo apt-get -y install python-pip
sudo apt-get -y install python3-pip
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip3
sudo pip install virtualenvwrapper
sudo pip3 install virtualenvwrapper

# pyenv setup
pyenv install anaconda3-4.4.0
pyenv install 3.6.1
pyenv global anaconda3-4.4.0
`pwd`/conda-setup.bash
pyenv global 3.6.1
`pwd`/pip_setup.bash
pyenv global system
