#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
   echo "Error: Please run this script with root access"
   exit 1
else
   echo "you are a root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
   echo "Error: Installing mysql is failed"
   exit 1
else
   echo "Installing mysql is success" 
fi   