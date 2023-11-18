if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
if not set -q TMUX
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t base
end

alias vim "nvim"
alias ls "lsd"
alias la "lsd -A"
alias img "kitty +kitten icat"
alias kill-orphans "pacman -Qtdq | sudo pacman -Rns -"

function lsl
    exa --tree --level=2
end

function tx
    kitty --title "latex" sh -c "latexmk -pdf -pvc $argv.tex" & && vim $argv.tex
end


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

