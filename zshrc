export ZSH="$HOME/.oh-my-zsh"
export DISPLAY=":1"
export MOZ_ENABLE_WAYLAND=1
export PATH=$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
export MPD_HOST="$XDG_RUNTIME_DIR/mpd/socket"

source $ZSH/oh-my-zsh.sh
plugins=(branch docker-compose gh golang pass ssh zsh-autosuggestions)

alias vim="nvim"
alias ls="eza -l --icons=always --git --time-style=relative"
alias ll="eza -l --icons=always --git --time-style=relative --total-size"
alias cd="z"
alias cp="rsync -a"
alias mv="rsync --archive --remove-source-files "$@""
alias cat="bat"
alias rm="trash-put "$@""

alias pacman="yay --noconfirm"
alias orphans="yay -Rns $(pacman -Qdtq)"
alias fetch="clear && rxfetch"
alias clear-cache="sudo rm -rf /var/cache /var/log ~/.cache ~/.cargo ~/.config/go && bat cache --build"

alias gc="cd ~/.config && lf"
alias gd="cd ~/Downloads && lf"
alias blue="bluetoothctl"

autoload -U compinit; compinit

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
