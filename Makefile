all:
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/tmux
	mkdir -p ~/.config/fish

	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/fish/config.fish ~/.config/fish/config.fish
	[ -d ~/.config/fish/functions ] || ln -s $(PWD)/fish/functions ~/.config/fish/functions
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.config/i3/config ] || ln -s $(PWD)/i3config ~/.config/i3/config
	[ -f ~/.config/tmux/tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.config/tmux/tmux.conf
	#[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	#[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	#[ -f ~/.git-prompt.sh ] || ln -s $(PWD)/git-prompt.sh ~/.git-prompt.sh

	touch ~/.hushlogin  # don't show last login message

config:
	ln -s $(PWD)/.config/qutebrowser ~/.config/qutebrowser

clean:
	rm -f ~/.config/fish
	rm -f ~/.config/i3/config
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.config/tmux/tmux.conf
	# rm -f ~/.git-prompt.sh
	# rm -f ~/.tmux.conf
	# rm -f ~/.git-prompt.sh
	# rm -f ~/.tigrc

.PHONY: all
