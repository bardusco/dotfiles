#!/bin/bash -l

shopt -s expand_aliases

alias homesick 2>/dev/null >/dev/null 

if [ $? -eq 0 ]
then
	homesick clone git://github.com/bardusco/dotfiles.git && homesick symlink dotfiles
	ln -sf ~/.homesick/repos/dotfiles/git_hooks/post_chekout ~/.homesick/repos/dotfiles/.git/hooks/.
	cd ~/.homesick/repos/dotfiles
	git submodule init && git submodule update
else
	echo "Homesick not found!!"
fi
