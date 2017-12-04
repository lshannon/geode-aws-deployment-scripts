#!/bin/bash
#################################################################################################
# This scripts everything locally to run to use `gfsh` to connect to the remote cluster locator.
# Calls the clean up script on the remote servers
#################################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh

# Call the clean up scripts on the Servers and then Locators
echo "Listing Files On The Servers"
while read IP; do
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP $REMOTE_SCRIPTS_DIRECTORY/clean_up.sh
done < servers.txt

echo "Listing Files On The Locators"
while read IP; do
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP $REMOTE_SCRIPTS_DIRECTORY/clean_up.sh
done < locators.txt

echo "Done!"
