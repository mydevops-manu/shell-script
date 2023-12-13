#!/bin/bash

echo "checking root access..."
ID=$(id -u)

CHECK(){

    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 installation failed"
        exit 1
    else
        echo "Successfully installed $2"
        $2 --version
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run script with root access"
    exit 1
else
    echo "Root access confirmed..."
    echo "Installing Mysql..."
fi

yum install mysql -y

CHECK $? "mysql"

yum install git -y

CHECK $? "git"




