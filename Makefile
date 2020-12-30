all:
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/tmux

	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.config/i3/config ] || ln -s $(PWD)/i3config ~/.config/i3/config
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	#[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	#[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	#[ -f ~/.git-prompt.sh ] || ln -s $(PWD)/git-prompt.sh ~/.git-prompt.sh

	touch ~/.hushlogin  # don't show last login message

clean:
	rm -f ~/.config/i3/config
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.bashrc
	rm -f ~/.git-prompt.sh
	rm -f ~/.tmux.conf
	# rm -f ~/.git-prompt.sh
	# rm -f ~/.tigrc

.PHONY: all
