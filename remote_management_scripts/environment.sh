#!/bin/bash
#############################################################
# This scripts everything locally to run to use `gfsh` to
# connect to the remote cluster locator.
#############################################################
export BASE_DIRECTORY=/home/ubuntu/cluster
export PACKAGE_DIRECTORY=$BASE_DIRECTORY/gemfire-ubuntu-package
export SCRIPTS_DIRECTORY=$PACKAGE_DIRECTORY/scripts
export DATA_DIRECTORY=$PACKAGE_DIRECTORY/data
export MEMBERS_DIRECTORY=$PACKAGE_DIRECTORY/members
#Configure the IPs of the Locators and Servers
export LOCATOR_SERVER_1=
export LOCATOR_SERVER_2=
export SERVER_1=
export SERVER_2=
export SERVER_3=
export SERVER_4=
