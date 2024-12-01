#!/bin/ksh
NTPG=1
NTPB=0
NtpServerList=("*10.188.176.200" "*10.188.176.201" "*10.189.176.200" "*10.188.16.200" "*10.188.16.201" "*10.189.16.200" "^*169.254.169.123")
#NtpServer=*10.189.16.200
NtpServer=$(chronyc sources | grep "*" | awk '{print $1 $2}')
currentServer=($NtpServer)
ipCount=0
for ip in "${currentServer[@]}";do
        if [[ " ${NtpServerList[@]} " =~ " $ip " ]]; then
                ((ipCount++))
        fi
done
if [[ " $ipCount " -gt " 0 " ]]; then
        echo "Data:"
	echo "NtpOutPut $NTPG"
else
	echo "Data:"
	echo "NtpOutput $NTPB"
fi

