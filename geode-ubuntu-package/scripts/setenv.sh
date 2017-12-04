#!/bin/bash
##########################################################################
# Runs on each remote machine in the Cluster. Sets up the environment
# So `gfsh` commands can run
##########################################################################

# Set the Geode environment variables #
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export USER_HOME=/home/ubuntu/cluster/geode-ubuntu-package
export GEODE=$USER_HOME/apache-geode
export GF_JAVA=$JAVA_HOME/bin/java
export CONF_DIR=$USER_HOME/conf
export LIB_DIR=$USER_HOME/lib
export SERVER_DIR_LOCATION=$USER_HOME/members
export IP_ADDRESS=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
export PUBLIC_IP_ADDRESS=`dig +short myip.opendns.com @resolver1.opendns.com`
export LOCATOR_PORT=<Add Locator Port>
export LOCATOR_1_IP=<Add Locator IP>
export LOCATOR_2_IP=<Add Locator IP>
export PUBLIC_DNS=`curl --silent http://169.254.169.254/latest/meta-data/public-hostname`
export PATH=$PATH:$JAVA_HOME/bin:$GEMFIRE/bin
export CLASSPATH=$CLASSPATH:$GEMFIRE/lib/*:$JAVA_HOME/lib/tools.jar:$CONF_DIR/:$CONF_DIR/*:$LIB_DIR/:$LIB_DIR/*
export HOSTNAME=$(hostname)
export LOCATOR_NAME="$(hostname)-locator"
export SERVER_NAME="$(hostname)-server"
export SERVER_NAME2="$(hostname)-server2"
export SERVER_HEAP=4g
