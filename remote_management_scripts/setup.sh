#!/bin/bash
#################################################################################################
# This script runs locally to make all the directories and upload the dependancies to
# run `gfsh` on each machine. It also configures the directories to start a Locator or
# server process
#################################################################################################
source ./environment.sh
echo "Running First Time Set Up:"
echo "1: Create directories (new install)"
echo "2: Open permissions on scripts"

read option
if [[ ("$option" -eq "1") ]]; then
	echo "Creating the base"
	ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 mkdir $BASE_DIRECTORY
	ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_2 mkdir $BASE_DIRECTORY
	ssh -i gemfire.pem ubuntu@$SERVER_1 mkdir $BASE_DIRECTORY
	ssh -i gemfire.pem ubuntu@$SERVER_2 mkdir $BASE_DIRECTORY
fi
if [[ ("$option" -eq "2") ]]; then
	echo "Opening Permissions"
	ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 chmod +x $SCRIPTS_DIRECTORY/*.sh
	ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 chmod +x $DATA_DIRECTORY/*.sh
	ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_2 chmod +x $SCRIPTS_DIRECTORY/*.sh
	ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_2 chmod +x $DATA_DIRECTORY/*.sh
	ssh -i gemfire.pem ubuntu@$SERVER_1 chmod +x $SCRIPTS_DIRECTORY/*.sh
	ssh -i gemfire.pem ubuntu@$SERVER_1 chmod +x $DATA_DIRECTORY/*.sh
	ssh -i gemfire.pem ubuntu@$SERVER_2 chmod +x $SCRIPTS_DIRECTORY/*.sh
	ssh -i gemfire.pem ubuntu@$SERVER_2 chmod +x $DATA_DIRECTORY/*.sh
fi
