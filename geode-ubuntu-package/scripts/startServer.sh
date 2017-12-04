#!/bin/bash
###################################################################################
# Runs on the remote machine. Uses gfsh to create a Server process on the machine
###################################################################################

source /home/ubuntu/cluster/geode-ubuntu-package/scripts/setenv.sh
if [ ! -d "$SERVER_DIR_LOCATION/$SERVER_NAME" ]; then
  echo "Excepted server working directory $SERVER_NAME"
  mkdir $SERVER_DIR_LOCATION/$SERVER_NAME
  mkdir $SERVER_DIR_LOCATION/$SERVER_NAME/data
  echo "Created server $SERVER_NAME directory"
fi
gfsh -e "start server --name=$SERVER_NAME --use-cluster-configuration=false --classpath=$CLASSPATH --bind-address=$IP_ADDRESS --dir=$SERVER_DIR_LOCATION/$SERVER_NAME --locators=$LOCATOR_1_IP[$LOCATOR_PORT],$LOCATOR_2_IP[$LOCATOR_PORT] --properties-file=$CONF_DIR/gemfire.properties --rebalance=true --J=-Xms$SERVER_HEAP --J=-Xmx$SERVER_HEAP --J=-XX:+PrintFlagsFinal --cache-xml-file=$CONF_DIR/cache.xml"
