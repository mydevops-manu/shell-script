#!/bin/bash


ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script stared at $TIMESTAMP" &>> $LOGFILE
echo "script stared at $TIMESTAMP" # display on terminal

CHECK(){

    if [ $1 -ne 0 ]
    then
        echo -e "ERROR:: $2 installation $R failed $N" &>> $LOGFILE
        exit 1
    else
        echo -e "$G Successfully $N installed $2" &>> $LOGFILE
        $2 --version &>> $LOGFILE
    fi
}

echo "checking root access..." &>> $LOGFILE

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR $N:: Please run script with root access" &>> $LOGFILE
    exit 1
else
    echo "Root access confirmed..." &>> $LOGFILE
    echo "Installing Mysql..." &>> $LOGFILE
fi

# echo "All arguments passed: $@"
# git mysql postfix net-tools
# package=git for first time

for package in $@
do
    yum installed $package &>> $LOGFILE # checking installed or not
    if [ $? -ne 0 ]     # if not installed
    then
        yum install $package -y &>> $LOGFILE # install the package
        CHECK $? "$package" # checking
    else
        echo "$package already installed $Y SKIPPING $N" &>> $LOGFILE
    fi       
done
echo "script ended at $TIMESTAMP" # display on terminal





