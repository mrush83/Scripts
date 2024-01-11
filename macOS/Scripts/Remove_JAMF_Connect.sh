#!/bin/bash

# Check if Jamf Connect is installed
if [ -d "/Applications/Jamf Connect.app" ]; then
  echo "Attempting to remove Jamf Connect | "
  if sudo rm -rf /Applications/Jamf\ Connect.app 2>&1; then
    # Pause to allow time for removal
    echo "Sleep for 15 seconds to allow time for removal | "
    sleep 15
  else
    rm_error=$?
    echo "Error: Failed to remove Jamf Connect. (Error code: $rm_error)"
  fi
else
   echo "Jamf Connect is not installed."
fi

exit 0