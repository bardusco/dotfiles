#!/bin/bash

if [ alias homesick 2>/dev/null >/dev/null ]
then
	homesick clone git://github.com/bardusco/dotfiles.git && homesick symlink dotfiles
	cd ~/.homesick/repos/dotfiles/.git/hooks && ln -s ../../git_hooks/post_chekout
	git submodules update
else:
	echo "Homesick not found!!"
fi
