#!/bin/bash -l

# install porwerline ang gnu command line utilities on MAC
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get install python2 python3 git fzf npm zsh zsh-syntax-highlighting neovim virtualenv fd-find ruby
    sudo gem install homesick
    mkdir ~/.virtualenvs 
    virtualenv ~/.virtualenvs/neovim2 -p python2
    virtualenv ~/.virtualenvs/neovim3 -p python3
    yes|sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/wfxr/forgit.git $HOME/forgit
    wget https://github.com/dandavison/delta/releases/download/0.4.3/git-delta_0.4.3_amd64.deb && sudo dpkg -i git-delta_0.4.3_amd64.deb
    wget https://github.com/sharkdp/bat/releases/download/v0.16.0/bat_0.16.0_amd64.deb && sudo dpkg -i bat_0.16.0_amd64.deb
    if [ ! -d ~/.fonts ]
    then
        mkdir ~/.fonts
    fi
    wget https://github.com/Falkor/dotfiles/raw/master/fonts/SourceCodePro%2BPowerline%2BAwesome%2BRegular.ttf -O ~/.fonts/SourceCodePro+Powerline+Awesome+Regular.ttf
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
    brew install ruby
    gem install homesick
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
	homesick clone git://github.com/bardusco/dotfiles.git && homesick link dotfiles
	ln -sf ~/.homesick/repos/dotfiles/git_hooks/post-merge ~/.homesick/repos/dotfiles/.git/hooks/.
	cd ~/.homesick/repos/dotfiles
	git submodule init && git submodule update
else
	echo "Homesick not found!!"
fi

