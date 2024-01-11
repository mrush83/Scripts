#!/bin/bash

# Get the list of pinned items from the dock (macOS 10.14 and later)
pinnedItems=$(defaults read com.apple.dock persistent-apps | \
grep "_CFURLString" | cut -d '"' -f 4 | sed 's/%20/ /g')

# Define the output file path in the current user's Documents folder
output_file="$HOME/Documents/pinned_items.txt"

# Check if there are pinned items and display the list
if [[ -n $pinnedItems ]]; then
    #echo "Pinned Items:"
    #echo "$pinnedItems"
    
    # Save the list to a text file in the Documents folder
    echo "$pinnedItems" > "$output_file"
    echo "Pinned items saved to $output_file."
else
    echo "No pinned items found."
fi