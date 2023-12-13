#!/bin/bash

echo "checking root access..."
ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run script with root access"
    exit 1
else
    echo "Root access confirmed..."
    echo "Installing Mysql..."
fi

yum install mysql -y

if [ $? -eq 0 ]
then
    echo "Successfully installed mysql"
    mysql --version
else
    echo "Mysql installation failed"
fi

yum install git -y

if [ $? -eq 0 ]
then 
    echo "Successfully installed git"
else
    echo "Git installation failed"
fi


