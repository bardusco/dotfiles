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
export PATH=$PATH:~/Projects/gocode/bin

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
unset HISTFILESIZE
HISTSIZE=3000
PROMPT_COMMAND="history -a"
export HISTSIZE PROMPT_COMMAND
# append to the history file, don't overwrite it
shopt -s histappend

export CLICOLOR=true
export LSCOLORS=gxfxcxdxbxegedabagacad

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

# Private envs
source ~/Dropbox/Private/.bash_private

# OS bash_profile
source ~/.bash_profile-${OS}

# PATH
export PATH=~/.bin:$PATH
# PATH > my scripts
export PATH=~/Dropbox/Scripts:$PATH

# powerline
export PATH=~/.local/bin:$PATH
export PYTHONPATH=$PYTHONPATH:~/.local/lib/python3.8/site-packages
source ~/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULTS_OPS="--extended"
#    --preview-window=:hidden 
export FZF_DEFAULT_OPTS="
    --layout=reverse
    --height=80%
    --multi
    --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
    --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237'
    --bind '?:toggle-preview'
    --bind 'ctrl-a:select-all'
    --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
    --bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
    --prompt='∼ '
"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias vim=nvim

source $HOME/forgit/forgit.plugin.zsh


export PATH="$HOME/.poetry/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
