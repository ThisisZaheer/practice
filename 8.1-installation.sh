#!/bin/bash

USERID=$(id -u)

RED="\e[31m"
NOCOLOR="\e[0m"

if [ $USERID -ne 0 ]
then 
   echo "Please run this script as root access"
   exit 1
else
   echo "You are a Super-User"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
   echo -e "Installation of Mysql is $RED Failure $NOCOLOR"
   exit 1
else
   echo -e "Installation of Mysql is $GREEN Success $NOCOLOR"
fi
