#!/bin/bash

# Check for the correct number of arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 <ip_range>"
    exit 1
fi

ip_range="$1"

# Iterate through the IP range and ping each address
for ip in $(seq 1 254); do
    ip_address="$ip_range.$ip"
    ping -c 1 -w 1 "$ip_address" > /dev/null

    # Check the exit status of the ping command
    if [ $? -eq 0 ]; then
        echo -e "\e[32m$ip_address is reachable\e[0m"  # Print in green
    else
        echo -e "\e[31m$ip_address is unreachable\e[0m"  # Print in red
    fi
done
