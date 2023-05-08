# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -n "$PS1" ] && source ~/.bash_profile

alias protontricks='flatpak run com.github.Matoking.protontricks'
alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'
