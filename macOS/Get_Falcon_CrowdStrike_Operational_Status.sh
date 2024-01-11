#!/bin/bash

# Falcon Path
falconctl_path="/Applications/Falcon.app/Contents/Resources/falconctl"

# Run the command and check for "Sensor operational"
if sudo "$falconctl_path" stats | grep -q "Sensor operational"; then
    echo "True"
else
    echo "False"
    exit 0
fi
exit 0