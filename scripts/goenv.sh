#!/bin/bash 
tmux rename-window  'LetsGo'
tmux split-window -v
tmux resize-pane -D 10
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "export GOPATH=$(pwd) " C-m
tmux send-keys "vim " C-m
tmux select-pane -t 1
tmux send-keys "export GOPATH=$(pwd) " C-m
tmux send-keys "clear" C-m
tmux select-pane -t 2
tmux send-keys "export GOPATH=$(pwd) " C-m
tmux send-keys "clear" C-m
tmux select-pane -t 0

