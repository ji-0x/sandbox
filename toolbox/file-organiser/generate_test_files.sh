#!/bin/zsh

DATA_DIR="/Users/jamininia/work/github/sandbox/toolbox/file-organiser/downloads"


echo "Generating test files in $DATA_DIR..."

# SOme csv files
touch "$DATA_DIR/sales_2026-01-01.csv"
touch "$DATA_DIR/sales_2026-01-15.csv"
touch "$DATA_DIR/sales_2026-02-01.csv"
touch "$DATA_DIR/sales_2026-03-11.csv"
touch "$DATA_DIR/sales_2026-06-15.csv"
touch "$DATA_DIR/sales_2026-10-21.csv"
touch "$DATA_DIR/sales_2026-12-21.csv"

# Some json files
touch "$DATA_DIR/users_2025-01-01.json"
touch "$DATA_DIR/users_2025-04-01.json"
touch "$DATA_DIR/users_2025-04-11.json"
touch "$DATA_DIR/users_2025-09-15.json"

touch "$DATA_DIR/logs_2026-01-31.txt"
touch "$DATA_DIR/logs_2026-02-01.txt"
touch "$DATA_DIR/logss_2026-03-25.txt"


# Future date
touch "$DATA_DIR/sales_2027-01-01.csv"
touch "$DATA_DIR/sales_2027-07-01.csv"


# Messy
touch "$DATA_DIR/sales_final.csv"
touch "$DATA_DIR/users_backup.json"
touch "$DATA_DIR/logfile.txt"
touch "$DATA_DIR/random_file"


# Different patterns
touch "$DATA_DIR/analytics-report-2026-03-01.csv"
touch "$DATA_DIR/system_export_2026-03-05.json"

# Create small dummy content
for file in "$DATA_DIR"/*; do
    echo "Dummy content for $file" >> "$file"
done

echo "Done"


# Bulk generation 
#for month in 01 02 03; do
  #for day in 01 05 10 15 20 25; do
    #touch "$BASE_DIR/sales_2026-$month-$day.csv"
   # touch "$BASE_DIR/users_2026-$month-$day.json"
  #  touch "$BASE_DIR/logs_2026-$month-$day.txt"
 # done
#done




