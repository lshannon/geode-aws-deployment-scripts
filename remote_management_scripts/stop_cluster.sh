#!/bin/bash
###############################################################################
# Stops all the members in the remote Cluster (including the Locator)
###############################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
echo "Shutting Down The Cache Servers"
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 $SCRIPTS_DIRECTORY/shutdownCluster.sh
echo "Done!"
