#!/bin/bash

user_list_file="user.list"

# Check if the user list file exists
if [ ! -f "$user_list_file" ]; then
    echo "User list file $user_list_file not found."
    exit 1
fi

# Read usernames from the file and reset passwords
while read -r username; do
    # Check if the user exists
    if id "$username" &>/dev/null; then
        # Generate a random password
        new_password=$(openssl rand -base64 12)
        
        # Change the user's password
        echo "$username:$new_password" | sudo chpasswd
        
        echo "Password reset for user: $username"
    else
        echo "User $username not found."
    fi
done < "$user_list_file"

echo "Password reset process completed."
