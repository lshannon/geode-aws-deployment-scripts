#!/bin/bash
###############################################################################
# Runs locally to start all the members in the Cluster
###############################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
echo "Getting All The Locator IPs"
# Getting All The Locators Server Binds
LOCATOR_1_PUBLIC=$(sed -n '1p' < locators.txt)
LOCATOR_2_PUBLIC=$(sed -n '2p' < locators.txt)
LOCATOR_3_PUBLIC=$(sed -n '3p' < locators.txt)
#Getting All Locator Bind
LOCATOR_1_PRIVATE=$(sed -n '1p' < locators-bind-address.txt)
LOCATOR_2_PRIVATE=$(sed -n '2p' < locators-bind-address.txt)
LOCATOR_3_PRIVATE=$(sed -n '3p' < locators-bind-address.txt)
echo "Locator 1 Public = $LOCATOR_1_PUBLIC"
echo "Locator 2 Public = $LOCATOR_2_PUBLIC"
echo "Locator 3 Public = $LOCATOR_3_PUBLIC"

echo "Locator 1 Private = $LOCATOR_1_PRIVATE"
echo "Locator 2 Private = $LOCATOR_2_PRIVATE"
echo "Locator 3 Private = $LOCATOR_3_PRIVATE"

echo "Start All The Locators"
ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$LOCATOR_1_PUBLIC $REMOTE_SCRIPTS_DIRECTORY/startLocator.sh $LOCATOR_1_PUBLIC $LOCATOR_2_PRIVATE $LOCATOR_3_PRIVATE
ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$LOCATOR_2_PUBLIC $REMOTE_SCRIPTS_DIRECTORY/startLocator.sh $LOCATOR_2_PUBLIC $LOCATOR_1_PRIVATE $LOCATOR_3_PRIVATE
ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$LOCATOR_3_PUBLIC $REMOTE_SCRIPTS_DIRECTORY/startLocator.sh $LOCATOR_3_PUBLIC $LOCATOR_1_PRIVATE $LOCATOR_2_PRIVATE

# Starting All The Servers
echo "Starting All The Servers"
while read IP; do
  echo "*******************"
  echo "Starting $IP:"
  {
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP $REMOTE_SCRIPTS_DIRECTORY/startServer.sh $IP $LOCATOR_1_PRIVATE $LOCATOR_2_PRIVATE $LOCATOR_3_PRIVATE
  } < /dev/null
  echo "*******************"
done < servers.txt

echo "Cluster Started!"
