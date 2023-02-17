set -x GOBIN $HOME/go/bin
set -x ARKADE $HOME/.arkade/bin
set -x CARGO $HOME/.cargo/bin
set -x SBIN /usr/sbin /usr/local/sbin 
set -x PATH $PATH $ARKADE $CARGO $GOBIN $CRC $HOME/bin $SBIN 
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH /usr/local/go/bin


set -gx EDITOR vim
fish_vi_key_bindings

# Ensure that GPG Agent is used as the SSH agent
set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -x GPG_TTY (tty)
gpgconf --launch gpg-agent

# git prompt settings
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_dirtystate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_conflictedstate "+"
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color_cleanstate green --bold
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_branch cyan --dim --italics

set fish_greeting ""

# https://github.com/gsamokovarov/jump
status --is-interactive; and source (jump shell fish --bind=z | psub)

test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'


# Senstive functions which are not pushed to Github
# It contains work related stuff, some functions, aliases etc...
#source ~/.config/fish/private.fish


alias k kubectl
alias vi nvim
alias vim nvim
#alias ssh "env TERM=xterm-256color ssh"
