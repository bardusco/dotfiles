#!/bin/bash

# colors 
if [ "$TERM" != "dumb" ] && [ `which dircolors` ]; then
    eval "`dircolors -b ~/.dircolors`"
fi
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    if [ "$OS" == "ubuntu" ]; then
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
    elif [ "$OS" == "osx" ]; then
        # and alias ls to GNUs alias
        # need to do: brew install coreutils
        alias dircolors='gdircolors'
        alias ls='gls --color=auto'
        alias grep='ggrep --color=auto'
    fi
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cdd='cd - ' # goto last dir cd'ed from
alias ts='date +%Y%m%d%H%M%S'

# Alias > git
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"

# Alias > tmxu
alias tmux="TERM=xterm-256color tmux"

# Alias > homesick
alias homesick=$HOME/.homeshick
