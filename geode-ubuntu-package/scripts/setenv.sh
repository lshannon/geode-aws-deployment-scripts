#!/bin/bash
##########################################################################
# Runs on each remote machine in the Cluster. Sets up the environment
# So `gfsh` commands can run
##########################################################################

# Set the Geode environment variables #
export JAVA_HOME=/home/ubuntu/jdk/jdk1.8.0_151
export CLUSTER_BASE_DIR=/home/ubuntu/geode/cluster
export CONF_DIR=$CLUSTER_BASE_DIR/conf
export GEODE_PACKAGE=$CLUSTER_BASE_DIR/geode-ubuntu-package
export GEODE_BINARY=$GEODE_PACKAGE/apache-geode
export LIB_DIR=$GEODE_PACKAGE/lib
export CLUSTER_CONFIG_DIR=cluster_config/cluster
export SERVER_DIR_LOCATION=$CLUSTER_BASE_DIR/members
export LOCATOR_PORT=10334
export PATH=$PATH:$JAVA_HOME/bin:$GEODE_BINARY/bin
export CLASSPATH=$CLASSPATH:$GEMFIRE/lib/*:$JAVA_HOME/lib/tools.jar:$LIB_DIR/:$LIB_DIR/*
export PRIVATE_IP=`curl --silent curl http://169.254.169.254/latest/meta-data/local-ipv4`
export LOCATOR_NAME="locator"
export SERVER_NAME="server"
export SERVER_HEAP=4g
