#!/bin/bash

read -p "Enter the starting UID: " start_uid
read -p "Enter the ending UID: " end_uid

for (( uid=start_uid; uid<=end_uid; uid++ )); do
    # Check if the user exists
    if id "user$uid" &>/dev/null; then
        # Lock the user account
        sudo usermod -L -e 1 "user$uid"
        echo "Locked user account: user$uid"
    else
        echo "User account user$uid not found."
    fi
done
