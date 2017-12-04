#!/bin/bash

#######################################################################
# Runs locally to set up environment to use `gfsh` to run locally
#######################################################################

export HOST=localhost
# Get the Java home stuff from shoe store
#export JAVA_HOME=/opt/jdk1.7.0_71
export GEMFIRE=../geode-ubuntu-package/apache-geode
export GF_JAVA=$JAVA_HOME/bin/java
#Using Cluster config - don't need
#export CONF_DIR=$GEMFIRE_WORKING/conf
export LIB_DIR=$GEMFIRE_WORKING/lib
export SERVER_DIR_LOCATION=./
export CLOSE_MESSAGE="Press any key to close this window..."
export LOCATOR_1="locatorA";
export LOCATOR_2="locatorB";
export LOCATOR_IP=127.0.0.1
export LOCATOR_PORT_1=10334
export LOCATOR_PORT_2=10335
export PATH=$PATH:$JAVA_HOME/bin:$GEMFIRE/bin
export CLASSPATH=$CLASSPATH:$LIB_DIR/*
export SERVER_HOST=$HOST
