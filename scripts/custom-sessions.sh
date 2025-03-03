#!/bin/bash

# If already inside a tmux session, detach and re-run outside of tmux
if [ -n "$TMUX" ]; then
    echo "Already inside a tmux session. Detaching first..."
    tmux detach
    exec wezterm start -- $SHELL -c "$0"  # Restart script outside tmux
    exit 0
fi

# Function to create a session only if it doesn't already exist
create_session() {
    local session_name=$1
    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new-session -d -s "$session_name"
    fi
}

# Create only the base sessions, no extra windows/panes
create_session "main"
create_session "local-dev"
create_session "cloud-vm"
create_session "persistent-server"

# Attach to main session
tmux attach -t main

fake_func(any) {


