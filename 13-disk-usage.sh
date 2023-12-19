#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
MESSAGE=""

while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    PARTITION=$(echo $line | awk '{print $1F}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="High Disk usage on $PARTITION : $USAGE <br>"
    fi
done <<< $DISK_USAGE

echo -e "Message : $MESSAGE"

#echo "$MESSAGE" | mail -s "High Disk usage alert" mistermanojkumar21@gmail.com

sh mail.sh "DevOps Team" "High Disk Usage" "$MESSAGE" "mistermanojkumar21@gmail.com" "ALERT High Disk Usage"