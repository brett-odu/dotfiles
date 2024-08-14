#!/bin/sh

# Start a new tmux session
tmux new-session -d -s nnn_session

# Split the window and run nnn
tmux send-keys 'nnn -a' C-m

# Split the window vertically and run the preview plugin using the current shell
tmux split-window -h
tmux send-keys "${SHELL} ~/.config/nnn/plugins/preview-tui" C-m

# Adjust the layout
tmux select-layout tiled

# Attach to the tmux session
tmux attach-session -t nnn_session
