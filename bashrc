# .bashrc file
# -----------------------------------
if [ "`id -gn`" == "`id -un`" -a `id -u` -gt 99 ]; then
	umask 002
else
	umask 022
fi

# ---------------------------------------------------------
[ -z "$PS1" ] && return

# Append to history
# See: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
HISTCONTROL=ignoreboth
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"
HISTSIZE=1000
HISTFILESIZE=2000


shopt -s checkwinsize


# http://www.debian-administration.org/articles/543.
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo -e $$\\t$USER\\t$HOSTNAME\\tscreen $WINDOW\\t`date +%D%t%T%t%Y%t%s`\\t$PWD"$(history 1)" >> ~/.bash_eternal_history'

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


#PS1='┌─[\[\033[0;32m\]\u\[\033[0;32m\]@\h\[\033[0m\]]───\[\033[0;34m\][\w]\[\033[0m\]───\[\e[0;0m\][${cwd}\t]\[\033[0m\]───\[\033[0m\] ${fill}\n└─\[\033[0m\]$(__git_ps1)\[\033[0m\]\$ '
case $TERM in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
	screen)
		;;
	*)
	    ;;
esac


EDITOR=vim

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
elif [[ $(uname) =~ (.*BSD|Darwin) ]]; then
    alias ls='ls -Gp'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -AF'
alias l='ls -CF'


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bashrc_custom ]; then
    . ~/.bashrc_custom
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
fi

exit 0


unset LANG
export LC_ALL=POSIX
export PATH=$PATH:$HOME/bin:/sbin:/usr/sbin


__git_ps1 () 
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " (%s)" "${b##refs/heads/}";
    fi
}

