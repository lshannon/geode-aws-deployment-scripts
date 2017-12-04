#!/bin/bash
###############################################################################
# Starts all the data members in the remote cluster (Locators stay running)
###############################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
echo "Shutting Down The Cache Servers"
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 $SCRIPTS_DIRECTORY/shutdownDataNodes.sh
echo "Done!"
