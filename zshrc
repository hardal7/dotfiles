export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias ls="lsd"

autoload -U compinit; compinit

# bun completions
[ -s "/home/hardal/.bun/_bun" ] && source "/home/hardal/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
