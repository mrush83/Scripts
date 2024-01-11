#!/bin/bash

# Set the name of the application to uninstall
app_name="Slack"

# Function to check if a process is running and kill it
kill_process() {
    local process_name="$1"
    if pgrep -x "$process_name" >/dev/null; then
        echo "Killing process: $process_name"
        sudo pkill -x "$process_name"
    fi
}

# Function to uninstall the specified application
uninstall_app() {
    local app_path="/Applications/$app_name.app"
    if [ -d "$app_path" ]; then
        echo "Uninstalling $app_name..."
        sudo rm -rf "$app_path"
        echo "$app_name has been uninstalled."
    else
        echo "$app_name is not installed."
    fi
}

# Function to uninstall dependent and component files/folders
uninstall_dependent_components() {
    # Specify paths to dependent and component files/folders here
    # For example:
    local dependent_path="/Library/Application Support/$app_name"

    # Check and uninstall dependent and component files/folders
    if [ -d "$dependent_path" ]; then
        echo "Removing dependent folder: $dependent_path"
        sudo rm -rf "$dependent_path"
    fi
}

# Check and kill the process (replace 'Slack' with the actual process name if needed)
kill_process "Slack"

# Uninstall the specified application
uninstall_app

# Uninstall dependent and component files/folders
uninstall_dependent_components

# Optionally, add more cleanup steps as needed

exit 0
