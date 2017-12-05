#!/bin/bash
###############################################################################
# Runs locally to start all the members in the Cluster
###############################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
now=$(date +"%T")
echo "Start Time : $now"
echo "Getting All The Locator IPs"
# Getting All The Locators
LOCATOR_1=$(sed -n '1p' < locators.txt)
LOCATOR_2=$(sed -n '2p' < locators.txt)
echo "Locator 1 = $LOCATOR_1"
echo "Pushing Up The Configuration Files"
echo "Locator 2 = $LOCATOR_2"
echo "Start All The Locators"
ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$LOCATOR_1 $REMOTE_SCRIPTS_DIRECTORY/startLocator.sh $LOCATOR_1 $LOCATOR_2
ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$LOCATOR_2 $REMOTE_SCRIPTS_DIRECTORY/startLocator.sh $LOCATOR_2 $LOCATOR_1

# Starting All The Servers
echo "Starting All The Servers"
while read IP; do
  echo "*******************"
  echo "Starting $IP:"
  ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP $REMOTE_SCRIPTS_DIRECTORY/startServer.sh $IP $LOCATOR_1 $LOCATOR_2
  echo "*******************"
done < servers.txt

now=$(date +"%T")
echo "End Time : $now"
echo "Cluster Started!"
