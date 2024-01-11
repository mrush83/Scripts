#!/bin/bash

# Function to check if an application is installed
function is_app_installed() {
    local app_name="$1"
    local app_path=$(mdfind "kMDItemDisplayName == '$app_name' && kMDItemKind == 'Application'")

    if [ -z "$app_path" ]; then
        return 1
    else
        return 0
    fi
}

# Check if all listed applications are installed
if  is_app_installed "Brave Browser";
  then
    echo "true"
else
    echo "false"
fi