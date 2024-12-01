ServiceCheck()
{
serviceOk=1
serviceNotOk=0
service="amazon-ssm-agent"
if systemctl is-active --quiet "$service"; then
	echo "Data:"
	echo "$service service status $serviceOk"
else
	echo "Data:"
	echo "$service status $serviceNotOk"
fi
}
ServiceCheck $*

