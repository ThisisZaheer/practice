#!/bin/bash

USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d . -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R Please run this script with root acess $N"
    exit 1
else
    echo -e "$Y You are a Super-User $N"
fi

validate(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is--> $R Failed $N"
    else
       echo -e "$2 is--> $M Success $N"
    fi
}

dnf install git -y
validate $? "Installing git"

dnf installl docker -y
validate $? "Installing docker"


