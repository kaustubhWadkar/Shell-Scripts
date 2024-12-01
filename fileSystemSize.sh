#!/bin/bash
df -h | awk 'NR>1' | awk '{print $5}' | tr -d "%" > /home/ec2-user/fileSystemSize.txt
filename="/home/ec2-user/fileSystemSize.txt"
hostname=$(hostname)
while IFS= read -r number; do
  if [[ "$number" =~ ^[0-9]+$ ]];
  then
    if (( number > 12 ));
    then
      echo "$number is greter then threshold check $hostname "
    fi
  fi  
done < "$filename"

