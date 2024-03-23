if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  tmux source ~/.config/tmux/tmux.conf
end

if not pgrep -f tmux > /dev/null
    tmux new-session -d -s base
    tmux rename-window -t 1 'Shell'
    #tmux send-keys -t 'Shell' 'clear && rxfetch' C-m

    tmux new-window -t base:2 -n 'Editor'
    tmux send-keys -t 'Editor' 'cd Projects' C-m
    tmux send-keys -t 'Editor' 'nvim' C-m

    tmux select-window -t 1
    tmux attach-session -d -t base
  else
    if not set -q TMUX
      tmux attach-session -d -t base
    else
      :
    end
end


alias vim "nvim"
alias ls "lsd"
alias zathura "zathura -l error"
alias pdf "libreoffice --headless --convert-to pdf"
alias img "kitty +kitten icat"
alias kill-orphans "pacman -Qtdq | sudo pacman -Rns -"
alias fetch "clear && rxfetch"
alias ws "~/.config/fish/workspace.fish"

function sudo 
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function theme
  ~/.tmux/plugins/tpm/bin/update_plugins all > /dev/null 2>&1
  cp ~/.config/kitty/themes/$argv.conf ~/.config/kitty/theme.conf
  pkill -USR1 kitty
  fish
end

