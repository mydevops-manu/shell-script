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

if [ $? -ne 0 ]
then
    echo "Error:: Mysql installation failed"
    exit 1
else
    echo "Successfully installed mysql"
    mysql --version  
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo "Error:: Git installation failed"
    exit 1   
else
    echo "Successfully installed git"
    git --version  
fi


