#!/bin/bash

loggedInUser=$(stat -f%Su /dev/console)

if [ "$loggedInUser" == "root"  ] || [ "$loggedInUser" == "_mbsetupuser" ] ; then
  exit 0
fi

if ! dseditgroup -o edit -a "$loggedInUser" -t user admin; then
  errorCode=$?
  echo "Error occurred with exit code $errorCode"
fi

exit 0