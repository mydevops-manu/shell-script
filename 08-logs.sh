#!/bin/bash

echo "checking root access..." &>> $LOGFILE
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script stared at $TIMESTAMP" &>> $LOGFILE

CHECK(){

    if [ $1 -ne 0 ]
    then
        echo -e "ERROR:: $2 installation $R failed $N" &>> $LOGFILE
        exit 1
    else
        echo -e "$G Successfully $N installed $2" &>> $LOGFILE
        $2 --version
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR $N:: Please run script with root access" &>> $LOGFILE
    exit 1
else
    echo "Root access confirmed..." &>> $LOGFILE
    echo "Installing Mysql..." &>> $LOGFILE
fi

yum install mysql -y &>> $LOGFILE

CHECK $? "mysql"

yum install git -y &>> $LOGFILE

CHECK $? "git"




