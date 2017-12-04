#!/bin/bash
###############################################################################
# Stops all the members in the Cluster (including the Locator)
###############################################################################
#!/bin/bash
source ./environment.sh
echo "Shutting Down The Cache Servers"
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 $SCRIPTS_DIRECTORY/shutdownCluster.sh
echo "Done!"
