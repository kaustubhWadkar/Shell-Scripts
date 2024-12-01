main()
{
NTPG=1
NTPB=0
NtpServerList=("10.188.176.200" "10.188.176.201" "10.189.176.200" "10.188.16.200" "10.188.16.201" "10.189.16.200" "169.254.169.123")
NtpServer=$(chronyc sources | awk '{print $2}' | awk '/^[0-9]/')

NtpWordCount=$(timedatectl | grep 'synchronized' | wc -w)

if [[ " $NtpWordCount " -gt " 3 " ]]; then
	NtpStatus=$(timedatectl | grep 'synchronized' | awk '{print $4}')
else
	NtpStatus=$(timedatectl | grep 'synchronized' | awk '{print $3}')
fi

NtpServiceStatus=$(timedatectl | grep 'NTP' | awk '{print $3}')
currentServer=($NtpServer)
ipCount=0
for ip in "${currentServer[@]}";do
        if [[ " ${NtpServerList[@]} " =~ " $ip " ]]; then
                ((ipCount++))
        fi
done

if [[ " $NtpWordCount " -gt " 3 " ]]; then
	if [[ " $ipCount " -gt " 0 " ]] && [[ " $NtpServiceStatus " == " active " ]]; then
           if echo "$NtpStatus" | grep -q 'yes' ; then
                echo "Data:"
		echo "NtpOutput $NTPG"
           else
                echo "Data:"
                echo "NtpOutput $NTPB"
        fi
        else
             echo "Data:"
             echo "NtpOutput $NTPB"
        fi
else
	if [[ " $ipCount " -gt " 0 " ]]; then
            if echo "$NtpStatus" | grep -q 'yes' ; then
                echo "Data:"
                echo "NtpOutput $NTPG"
            else
                echo "Data:"
                echo "NtpOutput $NTPB"
            fi
        else
                echo "Data:"
                echo "NtpOutput $NTPB"
        fi

fi
}
main $*
