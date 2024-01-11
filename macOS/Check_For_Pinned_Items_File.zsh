#!/bin/bash

file="$HOME/Documents/pinned_items.txt"

if [ -e "$file" ]; then
    echo "true"
else
    echo "false"
fi
