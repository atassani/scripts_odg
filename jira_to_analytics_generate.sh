#!/bin/bash
#
# Extracts data from JIRA of different projects prepared for ActionableAgile.
# By default expects the following extructure: 
#  J2A_PATH/jira_to_analytics.exe
#          /config/ all YAML files
#          /data/   all CSV results
#
# The environment variables can be overridden.
#
J2A_PATH="${J2A_PATH:-C:\code\jira_to_analytics}"
J2A_CONFIG="${J2A_CONFIG:-$J2A_PATH/config}"
J2A_RESULT="${J2A_RESULT:-$J2A_PATH/data}"
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
  echo "$password" | $J2A_PATH/jira_to_analytics.win64.exe -i $J2A_CONFIG/$project.yaml -o $J2A_RESULT/$project'_'$TODAY.csv
done


