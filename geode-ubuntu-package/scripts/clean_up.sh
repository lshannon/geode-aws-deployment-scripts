#!/bin/bash
###################################################################################
# These scripts run on the remote Geode member machines (assumes a Ubuntu OS)
# This script deletes all the working folders
# THIS WILL WIPE UP BACKED UP DATA
###################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source /home/ubuntu/geode/cluster/geode-ubuntu-package/scripts/setenv.sh
if [ -d "$SERVER_DIR_LOCATION/$SERVER_NAME" ]; then
	rm -fr $SERVER_DIR_LOCATION/$SERVER_NAME
	echo "$SERVER_DIR_LOCATION/$SERVER_NAME deleted"
fi
if [ -d "$SERVER_DIR_LOCATION/$LOCATOR_NAME" ]; then
	rm -fr $SERVER_DIR_LOCATION/$LOCATOR_NAME
	echo "$SERVER_DIR_LOCATION/$LOCATOR_NAME deleted"
fi
