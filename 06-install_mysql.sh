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
