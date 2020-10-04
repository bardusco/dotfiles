# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -n "$PS1" ] && source ~/.bash_profile

source "$HOME/.homesick/repos/homeshick/homeshick.sh"