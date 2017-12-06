#!/bin/bash
###################################################################################
# Runs on the remote machine. Uses gfsh to create a Locator process on the machine
# $1 Public DNS of this machines
# $2 Public DNS of other Locator
# $3 Public DNS of other Locator
###################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source /home/ubuntu/geode/cluster/geode-ubuntu-package/scripts/setenv.sh
if [ ! -d "$SERVER_DIR_LOCATION/$LOCATOR_NAME" ]; then
	mkdir $SERVER_DIR_LOCATION/$LOCATOR_NAME
	echo "Created the $LOCATOR_NAME directory"
	mkdir -p $SERVER_DIR_LOCATION/$LOCATOR_NAME/$CLUSTER_CONFIG_DIR
	echo "Created and populated the $SERVER_DIR_LOCATION/$LOCATOR_NAME/$CLUSTER_CONFIG_DIR directory"
fi
NAME="$LOCATOR_NAME$1"
echo "Starting Up: $LOCATOR_NAME running on $1 on port $LOCATOR_PORT"
gfsh -e "start locator \
--name=$NAME \
--dir=$SERVER_DIR_LOCATION/$LOCATOR_NAME \
--enable-cluster-configuration = false \
--J=-Dgemfire.locators=$2[$LOCATOR_PORT],$3[$LOCATOR_PORT] \
--J=-Dgemfire.hostname-for-clients=$1 \
--J=-Dgemfire.port=$LOCATOR_PORT \
--J=-Dgemfire.jmx-manager=true \
--J=-Dgemfire.jmx-manager-start=true \
--J=-Dgemfire.java.rmi.server.hostname=$1 \
--J=-Dgemfire.jmx-manager-hostname-for-clients=$1 \
--J=-Xms1g --J=-Xmx1g \
--J=-XX:+PrintFlagsFinal \
--J=-Dgemfire.log-level=error"
