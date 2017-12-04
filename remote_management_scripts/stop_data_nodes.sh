#!/bin/bash
###############################################################################
# Starts all the data members in the remote cluster (Locators stay running)
###############################################################################
#!/bin/bash
source ./environment.sh
echo "Shutting Down The Cache Servers"
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 $SCRIPTS_DIRECTORY/shutdownDataNodes.sh
echo "Done!"
