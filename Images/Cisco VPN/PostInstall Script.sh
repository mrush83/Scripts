#!/bin/sh

cd /Users/Shared/AnyConnect/
sh /Users/Shared/Anyconnect/setup.sh
chflags hidden /opt
rm -rf /Library/LaunchAgents/com.cisco.anyconnect.gui.plist
rm -rf /Users/Shared/AnyConnect

exit