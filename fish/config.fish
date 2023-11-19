if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
end

if not set -q TMUX
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t base
end

alias vim "nvim"
alias vf "fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
# alias sd "loc=$(fd --type d | fzf-tmux -p --reverse) && cd $loc"
alias ls "lsd"
alias la "lsd -A"
alias img "kitty +kitten icat"
alias kill-orphans "pacman -Qtdq | sudo pacman -Rns -"

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

