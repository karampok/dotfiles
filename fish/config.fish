set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
#set -gxp PATH $HOME/go/bin
#set -gx GOBIN $HOME/go/bin
set -gx EDITOR vim
fish_vi_key_bindings

#set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
#set -U fish_user_paths $HOME/.local/bin $fish_user_paths

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

# Senstive functions which are not pushed to Github
# It contains work related stuff, some functions, aliases etc...
#source ~/.config/fish/private.fish
