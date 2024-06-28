#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d . -f1)
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
   echo -e "$C Please run this script with root access $N"
   exit 1
else
   echo -e "$Y You are a Super-User $N"
fi

validate(){
    if [ $2 -ne 0 ]
    then
        echo -e "$2 is$R Failed $N"
    else 
        echo -e "$2 is$G Success $N"
    fi
}

dnf install nginx -y &>>$LOGFILE
validate $? "Installing nginx"

dnf install gcc -y &>>$LOGFILE
validate $? "Installing gcc"