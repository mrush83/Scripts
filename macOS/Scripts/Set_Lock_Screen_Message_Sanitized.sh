#!/bin/sh

# Get the current user
user=$(ls -l /dev/console | awk '{print $3}')

# Set the lock screen message
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Property of Company - Authorized Use Only - Help Desk: 1-000-000-0000"
if [ $? -ne 0 ]; then
  echo "Failed to set lock screen message."
fi

# Set the permissions for the new lock screen message
sudo chown "$user":admin /Library/Preferences/com.apple.loginwindow.plist
if [ $? -ne 0 ]; then
  echo "Failed to set permissions for lock screen message."
fi

exit 0