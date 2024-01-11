#!/bin/bash

# enter the required date on which the update must be installed. Enter the date as YYYYMMDD
update_deadline=20230201

# gets current date from the device
current_date=$(date +"%Y%m%d")

# compares current date to the required install date 
if [[ "$current_date" > "$update_deadline" ]] ;
then
    echo "true"
else
	echo "false"
fi