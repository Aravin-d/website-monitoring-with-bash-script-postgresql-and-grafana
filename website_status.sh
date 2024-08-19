#!/bin/bash


export PGDATABASE="websites_db"
export PGUSER="******"
export PGPASSWORD="******"


result_file="web_results.csv"


echo "url,status,time" > $result_file

echo "script running"

for url in $(cat ./sites.txt)
do
  status_code=$(curl -sI "$url" | grep -i "HTTP/" | awk '{print $2}')
  #
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  #
  psql -qc "INSERT INTO website_status (url, status_code, timestamp) VALUES ('$url', '$status_code', '$timestamp');"
  #
  echo "$url, $status_code, $timestamp" >> $result_file
done

echo "operation sucessfull. Results saved to ./$result_file"
