#!/bin/zsh

counterFile="/private/var/macOSupdater/mu_properties.plist"

if [[ ! -f "$counterFile" ]]; then

  echo "File not Found"

  exit 0

else
  date=$(/usr/libexec/PlistBuddy -c "Print :startDate" "$counterFile")
  deadlineTime=$(/usr/libexec/PlistBuddy -c "Print :deadlineTime" "$counterFile")
  if [[ -z $date ]]; then

    echo "No Updates Available"

  else

    echo "date: $date time: $deadlineTime"

  fi

fi