#!/bin/bash

DB_USER="*****"
DB_PASSWORD="*****"
DB_NAME="websites_db"
TABLE_NAME="website_status"

export PGPASSWORD=$DB_PASSWORD

TIME_PERIOD=$(date -d "-4 months" '+%Y-%m-%d')

echo "script running"

psql -U $DB_USER -d $DB_NAME -qc "DELETE FROM $TABLE_NAME WHERE timestamp < '$TIME_PERIOD';"

unset PGPASSWORD

echo "old data deleted successfuly, only data from the last 4 monts is retained"
