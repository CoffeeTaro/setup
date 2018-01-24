#!/bin/bash

mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
        ~/.vim/dein/repos/github.com/Shougo/dein.vim

sh ./dein-installer.sh ~/.vim/dein
cp -rf ./rc ~/.vim/

git clone https://github.com/tomasr/molokai
mv molokai/colors ~/.vim/
rm -rf ./molokai
