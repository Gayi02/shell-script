#!/bin/bash
SOURCE_DIR=/tmp/shellscript-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d SOURCE_DIR ]
then
    echo -e "$R source directory: $SOURCE_DIR doesn't exits. $N"
fi