# System Installation 

## Files used 
 install.sh: This script will automate the installation of ansible. 

 ## Features 
 - EUID check : verifies that the script is running with root privileges
 - Apt verification: Checks to make sure the apt package is used.
 - Confirmation prompt: Allows the user to opt-out before any system changes will occur.
 - Conflict detection: Checks that path for any existing ansible that will prevent any overwritting.
 - Silent execution: Will use -y flags and will redirect the output to /dev/null for a non interactive terminal. 

 ## Citations 
 [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) 

 Used Gemini to give me the format of the ansible script and what information to include.