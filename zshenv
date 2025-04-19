if ! pgrep -f tmux > /dev/null; then
    tmux new-session -d -s base
    tmux rename-window -t 1 'Shell'
    tmux send-keys -t 'Shell' 'clear && neofetch' C-m

    tmux new-window -t base:2 -n 'Editor'
    tmux send-keys -t 'Editor' 'cd Projects' C-m
    tmux send-keys -t 'Editor' 'nvim' C-m

    tmux select-window -t 1
    tmux attach-session -d -t base
    tmux source ~/.config/tmux/tmux.conf

    #tmux source ~/.config/tmux/tmux.conf
else
    if [ -z "$TMUX" ]; then
        tmux attach-session -d -t base
    fi
fi
