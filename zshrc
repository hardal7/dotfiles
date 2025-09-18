export ZSH="$HOME/.oh-my-zsh"
export DISPLAY=":1"
export PATH=$PATH:/home/hardal/.local/bin/tools:/home/hardal/go/bin

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias ls="lsd --group-directories-first -l"

autoload -U compinit; compinit

eval "$(starship init zsh)"
