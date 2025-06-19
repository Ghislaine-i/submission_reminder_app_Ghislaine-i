# submission_reminder_app_Ghislaine-i
Linux Assignment: Submission Reminder Application


This shell-based application will alert students who didn't submit the upcoming assignments through checking submission records and sending reminders.

# Project structure

|__ Create_environment.sh
|__ Copilot_shell_script.sh 
|__ README.md

*The Create_environment.sh file will create necessary directories and files for a program that alerts student about their upcoming assignments.
*The Copilot_shell_script.sh file will prompt the user to enter the assignment that he/she wants to check.
*README.md file will project instructions.

# Tools required for the tasks we will work 

- Linux OS (or WSL)
- Bash shell
- Basic shell tools: `sed`, `chmod`, `read`, `echo`
- Git (for version control)
 

# Instructions

1. Clone the repository
git clone https://github.com/your-username/submission_reminder_app_yourUsername.git

2. Change the directory (cd submission_reminder_app_yourUsername).

3. Create the Setup Script and make them executable
 vi create_environment.sh
chmod +x create_environment.sh

4. Run it 
./create_environment.sh

5. Enter your name when prompted and it will create a directory named submission_reminder_{yourName} with all necessary subdirectories and scripts.

6. Change Directory

cd submission_reminder_{yourName}

7. Create a copilot script, make it executable and run it.

vi copilot_shell_script
chmod +x copilot_shell_script.sh
./copilot_shell_script.sh
Enter the assignment name.

The script will update the config and runs the reminder logic.

# Git workflow
This project uses a two-branch structure

- Feature/setup branch for development and rough work.
- Main branch for final deliverables.

# The Main branch should only include :

- Create_environment.sh
- copilot_shell_script.sh
- README.md
 
# Objectives

Shell scripting and automation 

Text processing using sed

Understand Application Directory Structures

Git branching and clean commits

# Author

Name: INEZA Marie Ghislaine

GitHub: Ghislaine-i

Repo: submission_reminder_app_Ghislaine-i

# Notes

Use chmod +x on all .sh files before running.

Modify submissions.txt after setup to add more students.

Make sure startup.sh exists and works correctly in your environment.
