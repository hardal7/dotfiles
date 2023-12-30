if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  tmux source ~/.config/tmux/tmux.conf
end

if not set -q TMUX
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux rename-window -t 1 'Shell'
    tmux send-keys -t 'Shell' 'clear && rxfetch' C-m

    tmux new-window -t base:2 -n 'Editor'
    tmux send-keys -t 'Editor' 'nvim' C-m

    tmux new-window -t base:3 -n 'Monitor'
    tmux send-keys -t 'Monitor' 'btm' C-m
    tmux split-window -h -c 2
    tmux resize-pane -R 15
    tmux send-keys -t 'Monitor' 'htop' C-m

    tmux new-window -t base:4 -n 'Music'
    tmux send-keys -t 'Music' 'ncmpcpp --screen browser' C-m
    tmux split-window -h -c 2
    tmux send-keys -t 'Music' 'alsamixer -c 1' C-m
    tmux split-window -v -c 2
    tmux send-keys -t 'Music' 'cava' C-m
    tmux select-pane -t 1
    tmux split-window -v -c 2
    tmux send-keys -t 'Music' 'sptlrx --current "bold" --before "104,faint,italic" --after "104,faint"' C-m

    tmux select-window -t 1
    tmux attach-session -d -t base
end

alias vim "nvim"
alias ls "lsd"
alias pdf "libreoffice --headless --convert-to pdf"
alias img "kitty +kitten icat"
alias kill-orphans "pacman -Qtdq | sudo pacman -Rns -"
alias fetch "clear && rxfetch"

function sudo 
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function theme
  cp ~/.config/kitty/themes/$argv.conf ~/.config/kitty/theme.conf
  pkill -USR1 kitty
end

