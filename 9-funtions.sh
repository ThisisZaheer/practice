#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d . -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is:$R Failed $N"
        exit 1
    else 
        echo -e "$2 is:$G Success $N"
    fi
}

if [ $USERID -ne 0 ]
then
   echo -e "$R Please run this script with root access $N"
   exit 0
else 
   echo -e "$G You are a Super-User $N"
fi

dnf install mysql -y &>>$LOGFILE
validate $? "Installing Mysql Server" 

dnf install git -y &>>$LOGFILE
validate $? "Installing git" 