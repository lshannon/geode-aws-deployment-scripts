#!/bin/bash
#################################################################################################
# This scripts everything locally to run to use `gfsh` to connect to the remote cluster locator.
# Calls the clean up script on the remote servers
#################################################################################################
source ./environment.sh
echo "Cleaning Up"
echo "Cleaning Up: $SERVER_2"
ssh -i gemfire.pem ubuntu@$SERVER_2 $SCRIPTS_DIRECTORY/clean_up.sh
echo "Cleaning Up: $SERVER_1"
ssh -i gemfire.pem ubuntu@$SERVER_1 $SCRIPTS_DIRECTORY/clean_up.sh
echo "Cleaning Up: $LOCATOR_SERVER_2"
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_2 $SCRIPTS_DIRECTORY/clean_up.sh
echo "Cleaning Up: $LOCATOR_SERVER_1"
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 $SCRIPTS_DIRECTORY/clean_up.sh
echo "Done!"
