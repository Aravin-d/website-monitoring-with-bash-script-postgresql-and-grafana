#!/bin/bash


if [ $# -eq 0 ]; then
  echo "Please provide date in YYYY-MM-DD format"
  exit 1
fi


export PGDATABASE="websites_db"
export PGUSER="***"
export PGPASSWORD="***"


query_csv='query_db.csv'


psql -qc "SELECT url, status_code, timestamp FROM website_status WHERE DATE(timestamp) = '$1' ORDER BY timestamp;" > $query_csv

echo "query result for date $1"
cat "$query_csv"

echo "Results have been saved to $query_csv"
