#!/bin/bash
#################################################################################################
# This scripts everything locally to run to use `gfsh` to connect to the remote cluster locator.
# Does a remote `ls` of all remote members. Useful for verifying setup
#################################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ../set_env.sh

# List files on the Locator
echo "Listing Files On The Locators"
while read IP; do
    echo "*******************"
    echo "List Files On $IP:"
    {
      ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP ls -R $REMOTE_BASE_DIRECTORY
    } < /dev/null
    echo "*******************"
done < locators.txt

# List files on the Server
echo "Listing Files On The Servers"
while read IP; do
  echo "*******************"
  echo "List Files On $IP:"
  {
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP ls -R $REMOTE_BASE_DIRECTORY
  } < /dev/null
  echo "*******************"
done < servers.txt
