#!/bin/bash -l

# install porwerline ang gnu command line utilities on MAC
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get install python-dev mercurial python-pip git
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # http://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
    brew tap homebrew/dupes
    brew install libgit2 
    brew install git
    brew install mercurial 
    brew install coreutils
    brew install binutils
    brew install diffutils
    brew install ed --default-names
    brew install findutils --default-names
    brew install gawk
    brew install gnu-indent --default-names
    brew install gnu-sed --default-names
    brew install gnu-tar --default-names
    brew install gnu-which --default-names
    brew install gnutls --default-names
    brew install grep --default-names
    brew install gzip
    brew install screen
    brew install watch
    brew install wdiff --with-gettext
    brew install wget
    brew install htop
else
    exit
fi

if [ `which pip` ]
then
    pip install psutil
    pip install pygit2
    pip install virtualenvwrapper
    pip install --install-option="--prefix=~/.local/" git+git://github.com/Lokaltog/powerline
else
    echo "python pip not found. Please, install it and re-run setup.sh"
fi

if [ -d ~/.homesick ]
then
	source ~/.homesick/repos/homeshick/homeshick.sh
	homeshick clone git://github.com/bardusco/dotfiles.git && homeshick symlink dotfiles
	ln -sf ~/.homesick/repos/dotfiles/git_hooks/post-merge ~/.homesick/repos/dotfiles/.git/hooks/.
	cd ~/.homesick/repos/dotfiles
	git submodule init && git submodule update
else
	echo "Homesick not found!!"
fi

