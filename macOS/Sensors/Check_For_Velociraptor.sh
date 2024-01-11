#!/bin/bash

# Run the command and capture the version information
version_info=$(sudo /usr/local/sbin/velociraptor version | awk '/version:/ {print $2}')

# Check if version_info is null, 0, or doesn't exist
if [ -z "$version_info" ] || [ "$version_info" == "0" ]; then
    echo "False"
    exit 0
else
    echo "True"
fi
exit 0