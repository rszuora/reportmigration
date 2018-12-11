#!/bin/bash
# 
##
##
echo
echo "============ Push a report from a json file to a tenant ==========="
echo
echo "This code has no warranty and Zuora takes no responsibility of any kind "
echo "for anything that happens. Nothing. Use at your own risk. "
echo
if [[ $# -eq 0 ]] ; then
	echo "sample run from command line:"
	echo "  ./PostReport.sh Username@where.com  Sandbox-Prod FileName"
	echo "  ./PostReport.sh me@where.com  Sandbox ff8080815bb3610b015bb5e08afb03f6.json"
	echo "  ./PostReport.sh me@where.com  Prod ff8080815bb3610b015bb5e08afb03f6.json"
	echo
	echo
    exit 1
fi
##
## Default to sandbox
TENANT=zconnectsandbox

if [[ "$2" == "Prod" ]] ; then
   TENANT=zconnect
   echo "Production it is, hit ctrl-c if this isn't what you want"
   echo "Otherwise enter your tenant password:"
fi
echo $TENANT

read -s -p "Password: " password

echo
cat "$3"

JSON_CALL=`cat $3`
echo $JSON_CALL
echo curl -i -k -H "apiAccessKeyId:$1" -H "apiSecretAccessKey:NOTTHEPW" -H "Content-Type:application/json" -H "Accept:application/json" -d "$JSON_CALL" -X POST https://$TENANT.zuora.com/api/rest/v1/reports  
curl -i -k -H "apiAccessKeyId:$1" -H "apiSecretAccessKey:$password" -H "Content-Type:application/json" -H "Accept:application/json" -d "$JSON_CALL" -X POST https://$TENANT.zuora.com/api/rest/v1/reports 

echo
echo "============ Finished! ==========="
echo
echo
