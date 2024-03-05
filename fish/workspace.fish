#!/bin/fish
tmux new-session -d -s base
tmux rename-window -t 1 'Shell'
tmux send-keys -t 'Shell' 'clear && rxfetch' C-m

tmux new-window -t base:2 -n 'Editor'
tmux send-keys -t 'Editor' 'cd Projects' C-m
tmux send-keys -t 'Editor' 'nvim' C-m

tmux new-window -t base:3 -n 'Monitor'
tmux send-keys -t 'Monitor' 'btop' C-m
tmux split-window -h -c 2
tmux resize-pane -R 15
tmux send-keys -t 'Monitor' 'btm' C-m
tmux split-window -v -c 2
tmux send-keys -t 'Monitor' 'htop' C-m

tmux new-window -t base:4 -n 'Music'
tmux send-keys -t 'Music' 'ncmpcpp --screen browser' C-m
tmux split-window -h -c 2
tmux send-keys -t 'Music' 'alsamixer -c 1' C-m
tmux split-window -v -c 2
if not pgrep -f pulseaudio > /dev/null
  tmux send-keys -t 'Music' 'cava' C-m
end
tmux send-keys -t 'Music' 'cava' C-m
tmux select-pane -t 1
tmux split-window -v -c 2
tmux send-keys -t 'Music' 'sptlrx' C-m

tmux new-window -t base:5 -n 'Message'
tmux send-keys -t 'Message' 'irssi' C-m
tmux split-window -h -c 2
tmux send-keys -t 'Message' 'aerc' C-m

tmux select-window -t 1
tmux attach-session -d -t base
