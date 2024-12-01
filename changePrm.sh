#!/bin/bash
#
# readd file name
read -p " enter filename you want to change permision: " file
fileName=/home/ec2-user/permission/$file
chmod 762 $fileName
echo " permission changed "

