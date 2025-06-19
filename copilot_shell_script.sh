#!/bin/bash

# Prompt the user to enter the assignment name
read -p "What assignment do you want to check? " assignment

# paths from current directory
config="./submission_reminder_Ghislaine/config/config.env"
startup="./submission_reminder_Ghislaine/startup.sh"

# Check if config.env exists
if [ ! -f "$config" ]; then
    echo "Error: Config file not found at $config"
    exit 1
fi

# Replace the second line with new ASSIGNMENT value

sed -i 's/^ASSIGNMENT=.*/ASSIGNMENT="'"$assignment"'"/' "$config"
echo "Assignment updated to: $assignment"

# Run startup.sh
if [ -x "$startup" ]; then
    "$startup"
else
    echo "Error: can not run startup.sh. Please check its existence and permissions."
    exit 1

fi
