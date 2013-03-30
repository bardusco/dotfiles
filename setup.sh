#!/bin/bash -l

if [ -d ~/.homesick ]
then
	~/.homeshick clone git://github.com/bardusco/dotfiles.git && ~/.homeshick symlink dotfiles
	ln -sf ~/.homesick/repos/dotfiles/git_hooks/post-merge ~/.homesick/repos/dotfiles/.git/hooks/.
	cd ~/.homesick/repos/dotfiles
	git submodule init && git submodule update
else
	echo "Homesick not found!!"
fi

# install porwerline
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get install python-dev mercurial python-pip
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install libgit2 mercurial
else
    exit
fi

if [ `which pip` ]
then
    pip install psutil
    pip install pygit2
    pip install --install-option="--prefix=~/.local/" git+git://github.com/Lokaltog/powerline
else
    echo "python pip not found. Please, install it and re-run setup.sh"
fi
