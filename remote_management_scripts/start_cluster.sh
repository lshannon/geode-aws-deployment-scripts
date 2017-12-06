#!/bin/bash
###############################################################################
# Runs locally to start all the members in the Cluster
###############################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
echo "-------------------------------"
echo "- Getting All The Locator IPs -"
echo "-------------------------------"
echo ""
echo ""
# Getting All The Locators Server Binds
LOCATOR_1_DNS=$(sed -n '1p' < locators.txt | cut -d ' ' -f 1)
LOCATOR_1_PUBLIC=$(sed -n '1p' < locators.txt | cut -d ' ' -f 2)
LOCATOR_2_DNS=$(sed -n '2p' < locators.txt | cut -d ' ' -f 1)
LOCATOR_2_PUBLIC=$(sed -n '2p' < locators.txt | cut -d ' ' -f 2)
LOCATOR_3_DNS=$(sed -n '3p' < locators.txt | cut -d ' ' -f 1)
LOCATOR_3_PUBLIC=$(sed -n '3p' < locators.txt | cut -d ' ' -f 2)

echo "Locator 1 DNS = $LOCATOR_1_DNS"
echo "Locator 2 DNS = $LOCATOR_2_DNS"
echo "Locator 3 DNS = $LOCATOR_3_DNS"

echo "Locator 1 Public IP = $LOCATOR_1_PUBLIC"
echo "Locator 2 Public IP = $LOCATOR_2_PUBLIC"
echo "Locator 3 Public IP = $LOCATOR_3_PUBLIC"
echo ""
echo ""

echo "-----------------------------"
echo "- Start All The Locators    -"
echo "-----------------------------"
echo ""
echo "Starting Server On $LOCATOR_1_DNS: "
ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$LOCATOR_1_DNS $REMOTE_SCRIPTS_DIRECTORY/startLocator.sh $LOCATOR_1_DNS $LOCATOR_2_DNS $LOCATOR_3_DNS
echo ""
echo ""
echo "Starting Server On $LOCATOR_2_DNS:"
ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$LOCATOR_2_DNS $REMOTE_SCRIPTS_DIRECTORY/startLocator.sh $LOCATOR_2_DNS $LOCATOR_1_DNS $LOCATOR_3_DNS
echo ""
echo ""
echo "Starting Server On $LOCATOR_3_DNS :"
ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$LOCATOR_3_DNS $REMOTE_SCRIPTS_DIRECTORY/startLocator.sh $LOCATOR_3_DNS $LOCATOR_1_DNS $LOCATOR_2_DNS
echo ""
# Starting All The Servers
echo "-----------------------------"
echo "- Starting All The Servers  -"
echo "-----------------------------"
echo ""
while read IP; do
  echo "*****************************"
  echo "* Starting Server On $IP:   *"
  echo "*****************************"
  {
    DNS="$(echo $IP | cut -d ' ' -f 1)"
    echo "DNS: $DNS"
    PUBLIC_IP="$(echo $IP | cut -d ' ' -f 2)"
    echo "PUBLIC_IP: $PUBLIC_IP"
    ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$DNS $REMOTE_SCRIPTS_DIRECTORY/startServer.sh $DNS $LOCATOR_1_DNS $LOCATOR_2_DNS $LOCATOR_3_DNS
  } < /dev/null
done < servers.txt
echo ""
echo ""
gfsh -e "connect --locator=$LOCATOR_1_DNS[10334]" -e "list members"
echo "Cluster Started!"
