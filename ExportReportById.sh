#!/bin/bash
# 
echo
echo "============ Export Report by Report Id ==========="
echo
if [[ "$#" -ne "2" ]] ; then
	echo
	echo "Wrong number of parameters! "
	echo
	echo "  ./ExportReportById.sh Username@where.com ReportId"
    exit 1
fi

read -s -p "Password: " password

echo curl  -k -H "apiAccessKeyId:$1" -H "apiSecretAccessKey:NOPW" -H "Content-Type:application/json" -H "Accept:application/json"  -X GET https://zconnectsandbox.zuora.com/api/rest/v1/reports/report/$2 
curl  -k -H "apiAccessKeyId:$1" -H "apiSecretAccessKey:$password" -H "Content-Type:application/json" -H "Accept:application/json"  -X GET https://zconnectsandbox.zuora.com/api/rest/v1/reports/report/$2 > $2_temp.json
echo "{" > $2.json
cat $2_temp.json | grep -e \"name\" -e \"dsName\" -e \"datasource\" -e \"definition\" >> $2.json
echo "\"lableIds\": \"\"" >> $2.json
echo "}" >> $2.json
cat $2.json
echo
echo "============ Finished! ==========="
echo
rm $2_temp.json
