#!/bin/bash
#################################################################################################
# This scripts everything locally to run to use `gfsh` to connect to the remote cluster locator.
# Does a remote `ls` of all remote members. Useful for verifying setup
#################################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ../set_env.sh

# List files on the Locator
echo "Killing Java On The Locators:"
while read IP; do
    {
      ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP pkill java
    } < /dev/null
    echo "$IP Done"
done < locators.txt

# List files on the Server
echo "Killing Java On The Server:"
while read IP; do
  {
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP pkill java
  } < /dev/null
  echo "$IP Done"
done < servers.txt
