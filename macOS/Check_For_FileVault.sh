#!/bin/bash

# Check if FileVault is enabled
if fdesetup status | grep -q "FileVault is On"; then
    echo "true"
else
    echo "false"
fi
