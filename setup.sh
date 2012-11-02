#!/bin/bash

rm ~/.bashrc
rm ~/.bash_profile

rm ~/.vimrc

ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bash_profile

ln -s ~/.dotfiles/.vimrc ~/.vimrc

source ~/.bashrc
