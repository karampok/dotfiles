#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

## Install nvm: node-version manager
## https://github.com/creationix/nvm
#sudo apt-get install -y git
#sudo apt-get install -y curl
#curl https://raw.github.com/creationix/nvm/master/install.sh | sh

## Load nvm and install latest production node
#source $HOME/.nvm/nvm.sh
#nvm install v0.10.12
#nvm use v0.10.12

## Install jshint to allow checking of JS code within emacs
## http://jshint.com/
#npm install -g jshint

## Install rlwrap to provide libreadline features with node
## See: http://nodejs.org/api/repl.html#repl_repl
#sudo apt-get install -y rlwrap


# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
#wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh


# Install vim
sudo apt-get install -y vim  tmux rlwrap 
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

DIR=$PWD
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -f .vimrc ]; then
    mv .vim .vim_old
    mv .vimrc .vimrc_old
fi

cp -r $DIR/dotfiles .
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.tmux.conf .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.vimrc .
ln -sf dotfiles/.vim .

source $HOME/.bash_profile
vim +BundleInstall +qall
