#!/bin/bash

LOGIN=$(curl -skSL --cookie-jar cookies.txt -X POST --form username=${BMC_USERNAME} --form password=${BMC_PASSWORD} -H "Accept: application/json" https://${BMC_ENDPOINT}/api/session)
if [ $? -ne 0 ]; then
  exit 1
fi

CSRF_TOKEN=$(echo $LOGIN | jq -r .CSRFToken)