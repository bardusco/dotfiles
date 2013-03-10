#OS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export OS="ubuntu"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export OS="osx"
else
    exit
fi

# Bash functions
if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

# setup some basic variables
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export HOMEBREW_LLVM=true

: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

if [ -d ~/.bash_completion.d ]; then
    for file in ~/.bash_completion.d/*; do
        source $file
    done
fi

# rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# golang
export GOPATH=~/Projects/gocode

# Virtualenv
export PROJECT_HOME=$HOME/Projects
export WORKON_HOME=$HOME/.virtualenvs

# editor
export EDITOR='vim'
export VISUAL='vim'

# bash prompt
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000
export CLICOLOR=true
export LSCOLORS=gxfxcxdxbxegedabagacad

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Misc
export PAGER='less'
export CLICOLOR='yes'
export INPUTRC='~/.inputrc'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PS1='\[\033[01;32m\]\w\[\e[m\]\[\e[1;34m\]$(__bundler_ps1 " [%s]")$(__git_ps1 )\[\e[m\]\[\e[m\]\$ '

# OS bash_profile
source ~/.bash_profile-${OS}

# PATH
export PATH=~/.bin:$PATH
# PATH > my scripts
export PATH=~/Dropbox/Scripts:$PATH

# powerline
export PYTHONPATH=$PYTHONPATH:~/.local/lib/python2.7/site-packages/
source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
