#!/bin/bash
JIRA_TO_ANALYTICS="C:\code\jira_to_analytics"
CONFIG=$JIRA_TO_ANALYTICS/config
RESULT=$JIRA_TO_ANALYTICS/data
TODAY=`date +%Y-%m-%d`
read_password() {
  echo -n Password: 
  read -s password
  echo
}

replace_password() {
  sed -s -i "s/Password:.*$/Password: $password_to_change/" $CONFIG/$type.yaml
}

read_password
#for type in markingdom marketeers marketing_system itsquad; do
#for type in markingdom marketeers itsquad; do
for type in markingdom; do
  password_to_change=$password
  replace_password
  
  $JIRA_TO_ANALYTICS/jira_to_analytics.win64.exe -i $CONFIG/$type.yaml -o $RESULT/$type'_'$TODAY.csv
  
  password_to_change="****"
  replace_password
done


