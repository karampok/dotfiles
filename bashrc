set -o vi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#################
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${HOME}/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export EDITOR="nvim"
export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=/usr/local/go/bin:$PATH

###############
alias vi='nvim'
alias vi='vim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tmux="tmux -u"
alias systemctl='systemctl --no-pager'
alias k="kubectl"
eval "$(kubectl completion bash)"
complete -o default  -F __start_kubectl k
alias dc="docker-compose"
alias d="docker"
complete -F _docker_compose dc
eval "$(gopass completion bash)"
eval "$(jump shell --bind=z)" # https://github.com/gsamokovarov/jump
eval "$(direnv hook bash)" # https://github.com/direnv/direnv


LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
export LANG LC_ALL
export HISTCONTROL=ignoreboth:erasedups
export HISTFILE=~/.bash_history          # be explicit about file path
export HISTSIZE=100000                   # in memory history size
export HISTFILESIZE=100000               # on disk history size
export HISTTIMEFORMAT='%F %T '
set -o ignoreeof; # Do not exit an interactive shell upon reading EOF.
shopt -s histappend # append to history, don't overwrite it
shopt -s cmdhist    # save multi line commands as one command
shopt -s checkwinsize # check windows size if windows is resized
shopt -s lithist # Save multi-line commands to the history with embedded newlines
shopt -s dirspell direxpand # autocorrect directory if mispelled
shopt -s autocd # auto cd if only the directory name is given
shopt -s extglob #use extra globing features. See man bash, search extglob.
shopt -s dotglob #include .files when globbing.
shopt -s checkhash # Check the hash table for a command name before searching $PATH.
shopt -s globstar # Enable `**` pattern in filename expansion to match all files,
shopt -s no_empty_cmd_completion # Do not attempt completions on an empty line.
shopt -s nocaseglob # Case-insensitive filename matching in filename expansion.


if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    export DISPLAY=localhost:10.0
else
  export GPG_TTY=$(tty)
  gpgconf --launch gpg-agent
  echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null
fi
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
usermodmap=$HOME/.Xmodmap
[[ $DISPLAY ]] && [[ -f "$usermodmap" ]] && xmodmap "$usermodmap"

source ~/.bashprompt

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
