#!/usr/bin/env bash

# Get the Serial Number of the Machine
sn=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# Set the ComputerName, HostName and LocalHostName
scutil --set ComputerName $sn
scutil --set HostName $sn
scutil --set LocalHostName $sn

exit 0