#!bin/bash

error_handler() {
	echo " an error occured at line: ${BASH_LINENO[0]} " >> /tmp/error
	echo " Command: $BASH_COMMAND" >> /tmp/error
	#echo " cleaing up. . ."
	#rm -f "$output_file"
	exit 1
}

#set trap
#
trap 'error_handler' ERR

output_file=/tmp/sample.txt
touch "$output_file"

echo " file created"

echo " we are testing trap " >> "$outpu_file"

echoo " script is fine " 

