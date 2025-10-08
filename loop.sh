#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Clear console
clear

# Hide cursor
tput civis

# Loop infinitely until user input
while true; do
    for i in {0..4}; do
        frame=$(cat "$SCRIPT_DIR/f$i")
        echo -ne "\r$frame"

        # Check if user has pressed a key (non-blocking)
        read -t 0.2 -N 1 -s input
        if [ $? -eq 0 ]; then
            echo  # New line
            tput cnorm  # Show cursor
            clear
            exit 0
        fi
    done
done
