#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

$R="\e[31m"
$G="\e[32m"
$N="\e[0m"

if [ $USERID -ne 0 ]
then
   echo -e "$R Please run this script with root access $N"
   exit 0
else 
   echo -e "$G You are a Super-User $N"
fi