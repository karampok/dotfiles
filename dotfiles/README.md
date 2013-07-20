dotfiles.git
============
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure your `bash` and `vim` development environment as follows:

```sh
cd $HOME
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.tmux.con .
ln -sb dotfiles/.bashrc_custom .
```

