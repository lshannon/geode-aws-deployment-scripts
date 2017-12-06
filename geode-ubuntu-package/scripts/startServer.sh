#!/bin/bash
###################################################################################
# Runs on the remote machine. Uses gfsh to create a Server process on the machine
# $1 Public DNS of this machine
# $2 Public DNS of Locator 1
# $3 Public DNS of Locator 2
# $4 Public DNS of Locator 3
###################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source /home/ubuntu/geode/cluster/geode-ubuntu-package/scripts/setenv.sh
if [ ! -d "$SERVER_DIR_LOCATION/$SERVER_NAME" ]; then
  echo "Excepted server working directory $SERVER_NAME"
  mkdir $SERVER_DIR_LOCATION/$SERVER_NAME
  echo "Created server $SERVER_NAME directory"
fi
NAME="$SERVER_NAME$1"
gfsh -e "start server \
--name=$NAME \
--classpath=$CLASSPATH \
--cache-xml-file=$CONF_DIR/cache.xml \
--properties-file=$CONF_DIR/geode.properties \
--use-cluster-configuration=false \
--dir=$SERVER_DIR_LOCATION/$SERVER_NAME \
--J=-Dgemfire.locators=$2[$LOCATOR_PORT],$3[$LOCATOR_PORT],$4[$LOCATOR_PORT] \
--J=-Xms$SERVER_HEAP \
--J=-Xmx$SERVER_HEAP \
--J=-XX:+PrintFlagsFinal"
