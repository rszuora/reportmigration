#!/bin/bash
##
echo "============ Query reports ==========="
if [[ "$#" -ne "2" ]] ; then
	echo
	echo "Wrong number of parameters! "
	echo
	echo
	echo "  ./ListAllReports.sh Username@where.com SearchString"
    exit 1
fi

read -s -p "Password: " password

echo curl  -k -H "apiAccessKeyId:$1" -H "apiSecretAccessKey:NOPW" -H "Content-Type:application/json" -H "Accept:application/json"  -X GET https://zconnectsandbox.zuora.com/api/rest/v1/reports/search?query=$2 
curl  -k -H "apiAccessKeyId:$1" -H "apiSecretAccessKey:$password" -H "Content-Type:application/json" -H "Accept:application/json"  -X GET https://zconnectsandbox.zuora.com/api/rest/v1/reports/search?query=$2 | grep -e '"id" :' -e '"name" :'
echo
echo "============ Finished! ==========="
echo
