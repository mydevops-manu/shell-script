#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[3em"
N="\e[0m"

LOG_DIR="/tmp/roboshopshell-logs"

if [ ! -d $LOG_DIR ]
then
    echo -e "$R ERROR $N:: LOG_DIR does not exist"
fi

FILES_TO_DELETE=$(find $LOG_DIR -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES_TO_DELETE