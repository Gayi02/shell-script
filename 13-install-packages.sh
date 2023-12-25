#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $? -ne 0 ]
    then
       echo -e "Error: $2... $R failed $N"
       exit 1
    else
       echo -e "$2... $G success $N"
    fi   
}

if [ $ID -ne 0 ]
then
   echo -e "$R Error: Please run this script with root access $N"
   exit 1
else
   echo "you are a root user"
fi

for package in $@
do
  yum installed $package &>> $LOGFILE
  if [ $? -ne 0 ]
  then
     yum install $package -y &>> $LOGFILE
     VALIDATE $? "Installation of $package"
  else
    echo -e "$package already installed...$Y Skipping $N"
  fi
done       