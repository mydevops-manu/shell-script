#!/bin/bash

echo "checking root access..."
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK(){

    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 installation $R failed $N"
        exit 1
    else
        echo "$G Successfully $N installed $2"
        $2 --version
    fi
}

if [ $ID -ne 0 ]
then
    echo "$R ERROR $N:: Please run script with root access"
    exit 1
else
    echo "Root access confirmed..."
    echo "Installing Mysql..."
fi

yum install mysql -y

CHECK $? "mysql"

yum install git -y

CHECK $? "git"




