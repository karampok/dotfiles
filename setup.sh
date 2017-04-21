#!/bin/bash
# Simple setup.sh for for headless setup. 
debInst() {
        dpkg-query -Wf'${db:Status-abbrev}' "$1" 2>/dev/null | grep -q '^i'
}


pkgok=1
packages="vim-nox tmux git exuberant-ctags curl git mercurial make binutils bison gcc build-essential"
for pkg in $packages; do
    if ! debInst $pkg; then
        echo "sudo install $pkg to continue"
        pkgok=0
    fi
done

[  $pgkok ] || exit 1 


has_git=$(which git > /dev/null)
if [ $? -gt 0 ]; then
    echo "Git not available on this host, exiting"
    exit 1
fi


has_gvm=$(which gvm > /dev/null)
if [ $? -gt 0 ]; then
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    source $HOME/.gvm/scripts/gvm
    gvm install go1.4
    gvm use go1.4 --default
    go get -u github.com/jstemmer/gotags
fi

#has_rvm=$(which rvm > /dev/null)
#if [ $? -gt 0 ]; then
#    bash -s stable < <(curl -s -S -L https://get.rvm.io)
#    source $HOME/.rvm/scripts/rvm
#    rvm install 2.1.1
#    rvm use 2.1.1 --default
#fi

#has_nvm=$(which nvm > /dev/null)
#if [ $? -gt 0 ]; then
#    curl https://raw.githubusercontent.com/creationix/nvm/v0.17.3/install.sh | bash
#    source $HOME/.nvm/nvm.sh
#    nvm install v0.10.33
#    nvm use v0.10.33
#fi


# Install vim
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +BundleInstall +qall
else
    echo "Vim Vundle is already  installed, skipping"
fi



uname=$(uname)
if [[ "$uname" = "Darwin" ]]; then
    echo "Running MacOS X, installing to $HOME"
fi

dotfiles="bashrc bash_profile bash_aliases  vimrc gitconfig tmux.conf gitconfig"
for dotfile in $dotfiles; do
    ln -fs $HOME/dotfiles/$dotfile $HOME/.$dotfile
    if [ $? -gt 0 ]; then
        echo "Something went wrong when creating the symbolic links to\
            the repo. This should not happen so we will exit now."
        exit 1
    fi
done

echo "Done with environment setup!"
