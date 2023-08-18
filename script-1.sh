#!/bin/bash

# Check for the correct number of arguments
if [ $# -ne 4 ]; then
    echo "Usage: $0 <ftp_server> <username> <password> <remote_file_path>"
    exit 1
fi

ftp_server="$1"
username="$2"
password="$3"
remote_file_path="$4"

# Download the file using wget
wget --ftp-user="$username" --ftp-password="$password" "ftp://$ftp_server/$remote_file_path"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "File downloaded successfully: $remote_file_path"
else
    echo "Failed to download file: $remote_file_path"
fi
