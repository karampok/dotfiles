## gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm" 
gvm use go1.5.1 
export GOPATH=~/gospace/
export PATH="$GOPATH/bin:$HOME/bin:$PATH"
#gocd () { cd `go list -f '{{.Dir}}'  gitlab.swisscloud.io/appc-cf-services/$1`;}

# Bash wrapper to change directory to the output of gocd
gocd () {
  if dir=$($GOPATH/bin/gocd $1); then
    cd "$dir"
  fi
}

# Optional tab completion wrapper for $GOPATH/src
_gopath () {
  local cur
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  k=0
  for j in $( compgen -f "$GOPATH/src/$cur" ); do
    if [ -d "$j" ]; then
      COMPREPLY[k++]=${j#$GOPATH/src/}
    fi
  done
}  
complete -o nospace -F _gopath gocd   

## rvm
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
#rvm use ruby-2.1.1
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#export PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

## nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#nvm use v0.10.33
#nvm --version

curl -4 --silent --output ~/.ext-ip ipinfo.io/ip

# Vi key-bindings for shell (default is emacs)
#set -o vi

# make sure we get a proper locale for IRC
LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
export LANG LC_ALL

#[[ -s "/home/dev/.gvm/scripts/gvm" ]] && source "/home/dev/.gvm/scripts/gvm"
#if [ -e $HOME/dotfiles/git-completion.bash ]; then
#    . $HOME/dotfiles/git-completion.bash
#fi

# Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# Listing, directories, and motion
alias vi='vim'
alias grep='grep --color=auto'
alias ll="ls -alF"
alias cl='clear'
alias du='du -ch --max-depth=1'
alias treeacl='tree -A -C -L 2'
alias vless='/usr/share/vim/vimcurrent/macros/less.sh'
alias rec="arecord -f cd  /tmp/trecord ; aplay /tmp/trecord"
alias ttime="/usr/bin/time --format=' \n---- \nelapsed time is %e'ls"
alias mutt="TERM=screen-256color mutt"
#alias tmux="TERM=xterm-256color /usr/bin/tmux"
