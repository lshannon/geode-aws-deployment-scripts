#!/bin/bash
###################################################################################
# Runs on the remote machine. Uses gfsh to create a Server process on the machine
###################################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source /home/ubuntu/geode/cluster/geode-ubuntu-package/scripts/setenv.sh
if [ ! -d "$SERVER_DIR_LOCATION/$SERVER_NAME" ]; then
  echo "Excepted server working directory $SERVER_NAME"
  mkdir $SERVER_DIR_LOCATION/$SERVER_NAME
  echo "Created server $SERVER_NAME directory"
fi
gfsh -e "start server --name=$SERVER_NAME
--classpath=$CLASSPATH \
--server-port=0 \
--server-bind-address=$1 \
--bind-address=$BIND_IP \
--dir=$SERVER_DIR_LOCATION/$SERVER_NAME \
--locators=$2[$LOCATOR_PORT],$3[$LOCATOR_PORT],$4[$LOCATOR_PORT] \
--properties-file=$CONF_DIR/geode.properties \
--rebalance=true \
--J=-Xms$SERVER_HEAP --J=-Xmx$SERVER_HEAP --J=-XX:+PrintFlagsFinal \
--cache-xml-file=$CONF_DIR/cache.xml"
