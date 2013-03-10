#!/bin/bash -l

source ~/.bashrc

shopt -s expand_aliases

alias homesick 2>/dev/null >/dev/null 

if [ $? -eq 0 ]
then
	homesick clone git://github.com/bardusco/dotfiles.git && homesick symlink dotfiles
	ln -sf ~/.homesick/repos/dotfiles/git_hooks/post-merge ~/.homesick/repos/dotfiles/.git/hooks/.
	cd ~/.homesick/repos/dotfiles
	git submodule init && git submodule update
else
	echo "Homesick not found!!"
fi

# install porwerline to user
if [ `which pip` ]
then
    pip install --install-option="--prefix=~/.local/" git+git://github.com/Lokaltog/powerline
else
    echo "please install python pip and re-run this setup"
fi
