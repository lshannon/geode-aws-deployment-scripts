#!/bin/bash
#################################################################################################
# This scripts everything locally to run to use `gfsh` to connect to the remote cluster locator.
# Make sure the Cluster is shut down first
# Calls the clean up script on the remote servers
#################################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ../set_env.sh

# Call the clean up scripts on the Servers and then Locators
echo "Deleting working directories on the Servers"
while read IP; do
  {
    IP="$(echo $IP | cut -d ' ' -f 1)"
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP rm -fr $REMOTE_MEMBERS_DIRECTORY
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP mkdir -p $REMOTE_MEMBERS_DIRECTORY
  } < /dev/null
done < servers.txt

echo "Deleting working directories on the Locators"
while read IP; do
  {
    IP="$(echo $IP | cut -d ' ' -f 1)"
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP rm -fr $REMOTE_MEMBERS_DIRECTORY
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP mkdir -p $REMOTE_MEMBERS_DIRECTORY
  } < /dev/null
done < locators.txt

echo "Done!"
