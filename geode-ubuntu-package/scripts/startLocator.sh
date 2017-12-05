#!/bin/bash
###################################################################################
# Runs on the remote machine. Uses gfsh to create a Locator process on the machine
###################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source /home/ubuntu/geode/cluster/geode-ubuntu-package/scripts/setenv.sh
if [ ! -d "$SERVER_DIR_LOCATION/$LOCATOR_NAME" ]; then
	mkdir $SERVER_DIR_LOCATION/$LOCATOR_NAME
	echo "Created the $LOCATOR_NAME directory"
	mkdir $SERVER_DIR_LOCATION/$LOCATOR_NAME/$CLUSTER_CONFIG_DIR
	cp $CONF_DIR $SERVER_DIR_LOCATION/$LOCATOR_NAME/$CLUSTER_CONFIG_DIR
	echo "Created and populated the $SERVER_DIR_LOCATION/$LOCATOR_NAME/$CLUSTER_CONFIG_DIR directory"
fi
echo "Starting Up: $LOCATOR_NAME running on $1 on port $LOCATOR_PORT"
gfsh -e "start locator --name=$LOCATOR_NAME --locators=$1[$LOCATOR_PORT],$2[$LOCATOR_PORT] --bind-address=$1 --enable-cluster-configuration=true --dir=$SERVER_DIR_LOCATION/$LOCATOR_NAME --port=$LOCATOR_PORT --J=-Xms1g --J=-Xmx1g --J=-XX:+PrintFlagsFinal --log-level=error"
