#!/bin/bash
##########################################################################
# Runs on each remote machine in the Cluster. Sets up the environment
# So `gfsh` commands can run
##########################################################################

# Set the Geode environment variables #
export JAVA_HOME=/home/ubuntu/jdk/jdk1.8.0_151
export USER_HOME=/home/ubuntu/geode/cluster/geode-ubuntu-package
export GEODE=$USER_HOME/apache-geode
export GF_JAVA=$JAVA_HOME/bin/java
export CONF_DIR=$USER_HOME/conf
export LIB_DIR=$USER_HOME/lib
export CLUSTER_CONFIG_DIR=cluster_config/cluster
export SERVER_DIR_LOCATION=$USER_HOME/members
export LOCATOR_PORT=10334
export PATH=$PATH:$JAVA_HOME/bin:$GEMFIRE/bin
export CLASSPATH=$CLASSPATH:$GEMFIRE/lib/*:$JAVA_HOME/lib/tools.jar:$CONF_DIR/:$CONF_DIR/*:$LIB_DIR/:$LIB_DIR/*
export HOSTNAME=$(hostname)
export LOCATOR_NAME="$(hostname)-locator"
export SERVER_NAME="$(hostname)-server"
export SERVER_HEAP=4g
