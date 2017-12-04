#!/bin/bash
#################################################################################################
# This scripts uses `gfsh` to connect to the remote cluster locator.
# It cycles through each member to start the server
#################################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
echo "Restarting the servers"

echo "Listing Files On The Servers"
while read IP; do
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP $REMOTE_SCRIPTS_DIRECTORY/startServer.sh &
done < servers.txt

echo "Done"
