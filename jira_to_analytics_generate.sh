#!/bin/bash
JIRA_TO_ANALYTICS="C:\code\jira_to_analytics"
CONFIG=$JIRA_TO_ANALYTICS/config
RESULT=$JIRA_TO_ANALYTICS/data
TODAY=`date +%Y-%m-%d`

echo -n Password: 
read -s password
echo
#for type in markingdom marketeers marketing_system itsquad; do
#for type in markingdom marketeers itsquad; do
for type in markingdom marketeers itsquad; do
  echo "$password" | $JIRA_TO_ANALYTICS/jira_to_analytics.win64.exe -i $CONFIG/$type.yaml -o $RESULT/$type'_'$TODAY.csv"
done


