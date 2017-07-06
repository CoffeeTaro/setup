#!/bin/bash
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile 
pyenv install anaconda3-4.4.0
pyenv install 3.6.1

pyenv global anaconda3-4.4.0
./conda-setup.bash
./pip_setup.bash

pyenv global 3.6.1
./pip_setup.bash
