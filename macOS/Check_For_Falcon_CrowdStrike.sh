#!/bin/bash

# Falcon Path
falconctl_path="/Applications/Falcon.app/Contents/Resources/falconctl"

# Check if the file exists
if [ -e "$falconctl_path" ]; then
    echo "True"
else
    echo "False"
    exit 0
fi