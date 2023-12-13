#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run script with root access"
    
else
    echo "Installing Mysql..."
fi
