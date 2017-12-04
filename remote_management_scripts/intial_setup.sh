#!/bin/bash
#################################################################################################
# This script runs locally to make all the directories and upload the dependancies to
# run `gfsh` on each machine. It also configures the directories to start a Locator or
# server process
#################################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
echo "Running First Time Set Up:"
echo "1: Create directories (new install)"
echo "2: Uploading the binaries and scripts"
echo "3: Open permissions on scripts"

# Create the folder base
echo "Setting Up The Locators"
while read IP; do
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP mkdir -p $REMOTE_BASE_DIRECTORY
    scp -r -i $LOCAL_AWS_PEM_LOCATION ../geode-ubuntu-package ubuntu@$IP:$REMOTE_BASE_DIRECTORY
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP chmod +x $REMOTE_SCRIPTS_DIRECTORY/*.sh
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP $REMOTE_SCRIPTS_DIRECTORY/set_up_java.sh
done < locators.txt

echo "Setting Up The Servers"
while read IP; do
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP mkdir -p $REMOTE_BASE_DIRECTORY
    scp -r -i $LOCAL_AWS_PEM_LOCATION ../geode-ubuntu-package ubuntu@$IP:$REMOTE_BASE_DIRECTORY
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP chmod +x $REMOTE_SCRIPTS_DIRECTORY/*.sh
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP $REMOTE_SCRIPTS_DIRECTORY/set_up_java.sh
done < servers.txt
