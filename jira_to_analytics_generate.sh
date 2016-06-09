#!/bin/bash
JIRA_TO_ANALYTICS="C:\code\jira_to_analytics"
CONFIG=$JIRA_TO_ANALYTICS/config
RESULT=$JIRA_TO_ANALYTICS/data
TODAY=`date +%Y-%m-%d`

echo -n Password: 
read -s password
echo
projects=(
"markingdom" 
"marketeers" 
"itsquad"
);
for project in ${projects[@]}; do
  echo "$password" | $JIRA_TO_ANALYTICS/jira_to_analytics.win64.exe -i $CONFIG/$project.yaml -o $RESULT/$project'_'$TODAY.csv
done


