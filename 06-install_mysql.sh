#!/bin/bash

ID=$(id -u)

if[ $ID -ne 0 ]
then
    echo "ERROR:: Please run with root access"
    exit 1
else
    echo "Installing Mysql..."
fi
