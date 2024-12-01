#!/bin/ksh

NTPG=1
NTPB=0
NtpServerList=("10.188.176.200" "10.188.176.201" "10.189.176.200" "10.188.16.200" "10.188.16.201" "10.189.16.200" "*169.254.169.123")
NtpServer="*169.254.169.123"
ipCount=0

# Loop through each allowed IP and check if it matches NtpServer
for allowed_ip in "${NtpServerList[@]}"; do
    if [[ "$NtpServer" == "$allowed_ip" ]]; then
        ((ipCount++))
        break
    fi
done

if [[ "$ipCount" -gt 0 ]]; then
    echo "Data:"
    echo "NtpOutPut $NTPG"
else
    echo "Data:"
    echo "NtpOutput $NTPB"
fi

