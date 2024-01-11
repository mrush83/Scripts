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
if  is_app_installed "zoom.us" && is_app_installed "Safari" && is_app_installed "Workspace ONE Intelligent Hub" && is_app_installed "Firefox" && is_app_installed "Google Chrome" && is_app_installed "MacPass" && is_app_installed "Box" && is_app_installed "Microsoft Outlook" && is_app_installed "Microsoft Word" && is_app_installed "Microsoft Excel" && is_app_installed "Microsoft PowerPoint" && is_app_installed "Microsoft OneNote" && is_app_installed "Microsoft Remote Desktop" && is_app_installed "Slack" && is_app_installed "System Settings";
  then
    echo "true"
else
    echo "false"
fi