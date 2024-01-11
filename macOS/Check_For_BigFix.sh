#!/bin/bash

# Check if the process BESClientUI is running
if pgrep -x "BESClientUI" > /dev/null
then
    echo "True"
else
    echo "False"
fi