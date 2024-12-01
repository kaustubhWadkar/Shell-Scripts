#!/bin/bash
#

output=$(iostat | awk 'NR>5' | awk '{print $1" "$3" "$4}')
format=$(echo $output | awk '{print $2}')
#echo $format
#

if [[ $format == *"kB_reads/s"* ]];
then
	flag=true
else
	flag=false
fi

#----------------------------

i=0
rw=0
echo "Data:"
for value in $output; do
	if [ $i -gt 2 ]
	then
		if ! (( $i % 3 ))
		then
			disk=$value
		else
			if [[ $flag == "false" ]]
			then
				value=$(echo "$value / 1" |bc )
			fi
			if [ $rw -eq 0 ]
			then
				echo -e "$disk(KB_Read/s)\t$value"
				rw=1
			else
				echo -e "$disk(KB_write/s)\t$value"
				rw=0
			fi
		fi
	fi
	((i++))
done

