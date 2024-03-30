#!/bin/bash

sudo installer -pkg Config.pkg -target /
sudo installer -pkg Cisco\ Secure\ Client.pkg -target / -applyChoiceChangesXML choices.xml
exit