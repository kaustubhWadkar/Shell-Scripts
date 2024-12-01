#/bin/bash

sourceFile="/home/ec2-user/mainFiles/"
backup="/home/ec2-user/backupFiles"
rsync -a "$sourceFile" "$backup"
