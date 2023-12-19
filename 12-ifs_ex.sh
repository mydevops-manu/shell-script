#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[3em"
N="\e[0m"

DIR="/etc/passwd"

if [ ! -f $DIR ]
then
    echo -e "$R ERROR $N:: DIR does not exist"
fi

while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path
do
    echo "username: $username"
    echo "user ID: $user_id"
    echo "User Full name: $user_fullname"
done < $DIR