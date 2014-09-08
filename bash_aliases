[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm" 
export PATH="${GOPATH//://bin:}/bin:$PATH"
gvm use go1.3 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
ruby --version


export PYTHONPATH
export EDITOR=vim
export VISUAL=view
export GIT_SSH=`which ssh`

# Don't dump cores larger than this

# User-only writes
umask 0022

# Vi key-bindings for shell (default is emacs)
#set -o vi

# make sure we get a proper locale for IRC
LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
export LANG LC_ALL

if [ -e $HOME/dotfiles/git-completion.bash ]; then
    . $HOME/dotfiles/git-completion.bash
fi

# Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# Listing, directories, and motion
alias ll="ls -alrtF --color"
alias la="ls -A"
alias l="ls -CF"
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias m='less'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias cl='clear'
alias du='du -ch --max-depth=1'
alias treeacl='tree -A -C -L 2'
alias ls='ls -F --color=auto'
alias vless='/usr/share/vim/vimcurrent/macros/less.sh'
alias rec="arecord -f cd  /tmp/trecord ; aplay /tmp/trecord"
alias tmux='tmux -2 -u'



