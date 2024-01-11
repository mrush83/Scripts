#!/bin/bash

#loggedInUser=`/usr/bin/stat -f%Su /dev/console`

#if [ "$CurrentUser" == "root"  ] || [ "$CurrentUser" == "_mbsetupuser" ] ; then
#  exit 0
#fi

##removes user from the admin group (post-uninstall)
#dseditgroup -o edit -d "$loggedInUser" -t user admin
loggedInUser=`/usr/bin/stat -f%Su /dev/console`

if [ "$loggedInUser" == "root" ] || [ "$loggedInUser" == "_mbsetupuser" ]; then
  exit 0
fi

# Removes user from the admin group (post-uninstall)
if dseditgroup -o edit -d "$loggedInUser" -t user admin 2>&1; then
  echo "Successfully removed $loggedInUser from admin group."
else
  echo "Error: Failed to remove $loggedInUser from admin group."
fi

exit 0