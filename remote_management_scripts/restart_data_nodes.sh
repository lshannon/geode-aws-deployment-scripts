#!/bin/bash
#################################################################################################
# This scripts uses `gfsh` to connect to the remote cluster locator.
# It cycles through each member to start the server
#################################################################################################
source ./environment.sh
echo "Restarting the servers"
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 $SCRIPTS_DIRECTORY/startServer.sh &
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 $SCRIPTS_DIRECTORY/startServer2.sh &
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_2 $SCRIPTS_DIRECTORY/startServer.sh &
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_2 $SCRIPTS_DIRECTORY/startServer2.sh &
ssh -i gemfire.pem ubuntu@$SERVER_1 $SCRIPTS_DIRECTORY/startServer.sh &
ssh -i gemfire.pem ubuntu@$SERVER_1 $SCRIPTS_DIRECTORY/startServer2.sh &
ssh -i gemfire.pem ubuntu@$SERVER_2 $SCRIPTS_DIRECTORY/startServer.sh &
ssh -i gemfire.pem ubuntu@$SERVER_2 $SCRIPTS_DIRECTORY/startServer2.sh &
