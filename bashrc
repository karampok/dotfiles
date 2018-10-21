### Install
#  To source .bashrc, create .bash_profile with content:
#    if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 
###############

# Senstive functions which are not pushed to Github
# It contains GOPATH, some functions, aliases etc...
[ -r ~/.bash_private ] && source ~/.bash_private

# On Mac OS X: brew install bash-completion@2
if [ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]; then
  source $(brew --prefix)/etc/profile.d/bash_completion.sh 
  # /usr/local/etc/bash_completion.d/kubectl
  complete -o default -o nospace -F __start_kubectl k
fi

# Get it from the original Git repo: 
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# # Get it from the original Git repo: 
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

###############
# Aliases (custom)
alias vi='nvim'
alias vim='nvim'
alias vi='vim'
alias compile-ssh-config='rm  ~/.ssh/config && cat ~/.ssh/configs/*.config > ~/.ssh/config'
alias tmux="tmux -u"
alias k="kubectl"
 # Alias
#################
# Git
# Exports (custom)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:${HOME}/bin"
export EDITOR="nvim"
export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1

# enable GIT prompt options
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

#GO
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

###############
# Bash settings
# -- Prompt
# If we don't use the below git master one, use this simple
# PS1="\[$(tput setaf 6)\]\W\[$(tput sgr0)\]\[$(tput sgr0)\] \$ "

# 1. Git branch is being showed
# 2. Title of terminal is changed for each new shell
# 3. History is appended each time
export PROMPT_COMMAND='__git_ps1 "\[$(tput setaf 6)\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]" " "; echo -ne "\033]0;${PWD##*/}\007"$'


# -- History
export HISTCONTROL=ignoreboth:erasedups  
export HISTFILE=~/.bash_history          # be explicit about file path
export HISTSIZE=100000                   # in memory history size
export HISTFILESIZE=100000               # on disk history size
export HISTTIMEFORMAT='%F %T '
shopt -s histappend # append to history, don't overwrite it
shopt -s cmdhist    # save multi line commands as one command
LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
export LANG LC_ALL


# Save multi-line commands to the history with embedded newlines
# instead of semicolons -- requries cmdhist to be on.
shopt -s lithist

# -- Completion
# -- Functions
# -- Misc
set -o ignoreeof; # Do not exit an interactive shell upon reading EOF.
shopt -s checkwinsize # check windows size if windows is resized
shopt -s dirspell direxpand # autocorrect directory if mispelled
shopt -s autocd # auto cd if only the directory name is given
shopt -s extglob #use extra globing features. See man bash, search extglob.
shopt -s dotglob #include .files when globbing.
shopt -s checkhash # Check the hash table for a command name before searching $PATH.
shopt -s globstar # Enable `**` pattern in filename expansion to match all files,
shopt -s no_empty_cmd_completion # Do not attempt completions on an empty line.
shopt -s nocaseglob # Case-insensitive filename matching in filename expansion.


# brew install jump
# https://github.com/gsamokovarov/jump
eval "$(jump shell --bind=z)"

# brew install direnv
# https://github.com/direnv/direnv
eval "$(direnv hook bash)"
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"'echo -e $PWD "$(history 1| cut -c 8-)" >> $HOME/.bash_eternal'


gpgconf --launch gpg-agent
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
