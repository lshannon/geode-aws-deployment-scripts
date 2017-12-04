#!/bin/bash
###################################################################################
# Runs on a remote machine. Uses `gfsh` to shut down a locator process
###################################################################################
source /home/ubuntu/cluster/gemfire-ubuntu-package/scripts/setenv.sh
gfsh -e "stop locator --dir=$SERVER_DIR_LOCATION/$LOCATOR_NAME"
echo "$LOCATOR_NAME is stopped"
