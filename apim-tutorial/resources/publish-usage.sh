#!/bin/bash

access_token=$(curl -X POST https://dev.apim.com/oauth2/token -H 'Authorization: Basic bzBPZ0ZhN1JLVm43WVp0WFdRMHJRMUhHeDY0YTpmeUZmRW9mR2ZDejVocmNtYW9lQW14VFhoR1lh' -d 'grant_type=password&username=admin&password=admin&scope=apim:monetization_usage_publish' -k | jq -r '.access_token')

echo $access_token

curl -k -H "Authorization: Bearer $access_token" -X POST -H "Content-Type: application/json" https://dev.apim.com/api/am/admin/v3/monetization/publish-usage

echo ""
