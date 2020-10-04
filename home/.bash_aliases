#!/bin/bash

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -f ~/.dircolors ]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    if [ "$OS" == "ubuntu" ]; then
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
        eval "$(dircolors -b ~/.dircolors)"
    elif [ "$OS" == "osx" ]; then
        # and alias ls to GNUs alias
        # need to do: brew install coreutils
        alias dircolors='gdircolors'
        alias ls='gls --color=auto'
        eval "$(gdircolors -b ~/.dircolors)"
    fi
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cdd='cd - ' # goto last dir cd'ed from
alias ts='date +%Y%m%d%H%M%S'

# Alias > git
#alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"

# Alias > tmxu
alias tmux="TERM=xterm-256color tmux"

# python httpserver
alias http-server='python -m SimpleHTTPServer'

# vai para o diretorio do dotfiles
alias cddot='cd ~/.homesick/repos/dotfiles'

# Alias > homesick
#alias homesick=$HOME/.homeshick
