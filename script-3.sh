#!/bin/bash

report_file="filesystem_report.txt"
date_stamp=$(date +'%Y-%m-%d %H:%M:%S')

echo "File System Space Utilization Report" > "$report_file"
echo "Generated on: $date_stamp" >> "$report_file"
echo "" >> "$report_file"

df -h >> "$report_file"
