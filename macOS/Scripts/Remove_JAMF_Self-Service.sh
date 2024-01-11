#!/bin/bash
# Checking if Jamf Self Service is installed
if [ -d "/Applications/Jamf Self Service.app" ]; then
    echo "Attempting to remove Jamf Self Service... | "
    /usr/local/jamf/bin/jamf removeFramework 2>/dev/null
    if [ $? -ne 0 ]; then
        rm_error=$?
        echo "Error: Failed to remove Jamf Self Service. (Error code: $rm_error)"
    fi
else
    echo "Jamf Self Service is not installed."
fi

exit 0