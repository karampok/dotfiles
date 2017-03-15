# .bashrc file
#https://github.com/mindjiver/dotfiles/blob/master/bash_aliases
# -----------------------------------
# ---------------------------------------------------------
[ -z "$PS1" ] && return

# Append to history
# See: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
HISTCONTROL=ignoreboth
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"
HISTSIZE=1000
HISTFILESIZE=10000


shopt -s checkwinsize
#export TERM="xterm-256color"
#eval $(gpg-agent --daemon)



# http://www.debian-administration.org/articles/543.
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo -e $$\\t$USER\\t$HOSTNAME\\tscreen $WINDOW\\t`date +%D%t%T%t%Y%t%s`\\t$PWD"$(history 1)" >> ~/.bash_eternal_history'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

[[ -s "/usr/local/etc/bash_completion.d/password-store" ]] && source "/usr/local/etc/bash_completion.d/password-store"
[[ -s "/etc/bash_completion.d/git-prompt" ]] && source "/etc/bash_completion.d/git-prompt"
[[ -s "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh" ]] && source "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh"

EDITOR=vim
PS1="--[\[\033[0;32m\]\u\[\033[0m\]@\[\033[0;31m\]\h\[\033[0m\]]--[\[\033[34m\]\w\[\033[0m\]]--\[\033[32m\]\$(__git_ps1)\[\033[0m\]\n--$ "


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#eval "$(docker-machine env dev)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
