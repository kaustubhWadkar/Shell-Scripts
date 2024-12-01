#!/bin/bash
#
urls=( https://www.geeksforgeeks.org https://fhjsfffjkj.com https://www.geeksforgeeks.org https://stackoverflow.com/ https://www.icicibank.com/ )
#statusCode=$(curl -o /dev/null -s -w "%{http_code}\n" $url)
#url=https://www.geeksforgeeks.org

for url in "${urls[@]}";
do
	statusCode=$(curl -o /dev/null -s -w "%{http_code}\n" $url)
	if [[ $statusCode -eq 200 ]]
	then 
		echo " $url is working fine "
	else
		echo " $url is not working fine "

	fi
done


