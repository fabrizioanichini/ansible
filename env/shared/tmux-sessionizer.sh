#!/usr/bin/env bash

# Start tmux server if it's not already running
tmux start-server

session=$(find ~/projects ~/tomato -mindepth 1 -maxdepth 1 -type d | fzf)
parent_folder=$(basename "$(dirname "$session")")
selected_folder=$(basename "$session")
session_name="${parent_folder}-${selected_folder}"

echo "session $session_name"

if ! tmux has-session -t "$session_name" 2>/dev/null; then
    tmux new-session -s "$session_name" -c "$session" -d
fi

# Check if we're already inside a tmux session
if [ -n "$TMUX" ]; then
    tmux switch-client -t "$session_name"
else
    tmux attach-session -t "$session_name"
fi