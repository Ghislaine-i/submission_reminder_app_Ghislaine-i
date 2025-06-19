#!/bin/bash

# Prompt for name
read -p "Enter your name: " user_name
dir_name="submission_reminder_${user_name}"

# Create structure
mkdir -p "$dir_name/app" "$dir_name/config" "$dir_name/modules" "$dir_name/assets"

# content of the reminder.sh file
cat << 'EOF' > "$dir_name/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF

# content of the functions.sh file
cat << 'EOF' > "$dir_name/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF

# content of the config.env file
cat << 'EOF' > "$dir_name/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# content of the submissions.txt file
cat << EOF > "$dir_name/assets/submissions.txt"

student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
# Add 5 more records:
john,Shell Basics, not submitted
lucy,Shell Permissions,pending
ben,Shell Navigation, not submitted
nancy,Git,not submitted
elijah,Shell Permissions,pending
grace,Git,pending
alan,Shell Basics,pending
adda,Shell Permissions, not submitted
Mary,Git, not submitted
Aliya,Shell Basics, not submitted
EOF

# create startup.sh file to run the reminder
cat << 'EOF' > "$dir_name/startup.sh"
#!/bin/bash
cd "$(dirname "$0")"
source ./config/config.env
source ./modules/functions.sh
bash ./app/reminder.sh
EOF

# Make scripts executable
find "$dir_name" -type f -name "*.sh" -exec chmod +x {} \;

echo " Environment setup has successfully finished in '$dir_name'."
