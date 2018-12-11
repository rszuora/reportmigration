#!/bin/bash
# 
##
##
echo
echo "============ List report id and names ==========="
echo
echo "sample run from command line:"
echo "  ./QueryReports.sh Username@where.com SearchString"
echo
echo "you'll get back a list of id/name combos, id is first, then name"
echo "feed the id you want to export into the exportreport.sh script"
echo
read -s -p "Password: " password

echo curl  -k -H "apiAccessKeyId:$1" -H "apiSecretAccessKey:NOPW" -H "Content-Type:application/json" -H "Accept:application/json"  -X GET https://zconnectsandbox.zuora.com/api/rest/v1/reports/search?query=$2 
curl  -k -H "apiAccessKeyId:$1" -H "apiSecretAccessKey:$password" -H "Content-Type:application/json" -H "Accept:application/json"  -X GET https://zconnectsandbox.zuora.com/api/rest/v1/reports/search?query=$2 > jsonreports.txt
cat jsonreports.txt | grep -e \"id\" -e \"name\"
echo
echo "============ Finished! ==========="
echo
