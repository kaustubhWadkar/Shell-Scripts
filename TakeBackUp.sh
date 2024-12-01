#!/bin/bash

error_handler() {

 echo " an error occured at line: ${BASH_LINENO[0]} "
 exit 1

}

trap 'error_handlr' ERR

read -p " Enter file name you want to backup : " fileName

CreteBackUP() {
 if [ -f $1 ]
 then
	 CurrentDate=$(date +%Y-%m-%d)
	 Back="/tmp/$1_Backup_$CurrentDate"
	 cp $1 $Back
 else
   echo " file not present "
 fi   


}

CreteBackUP $fileName
