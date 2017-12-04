#!/bin/bash
#################################################################################################
# This scripts everything locally to run to use `gfsh` to connect to the remote cluster locator.
# Does a remote `ls` of all remote members. Useful for verifying setup
#################################################################################################
source ./environment.sh
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_1 ls $MEMBERS_DIRECTORY
ssh -i gemfire.pem ubuntu@$LOCATOR_SERVER_2 ls $MEMBERS_DIRECTORY
ssh -i gemfire.pem ubuntu@$SERVER_1 ls $MEMBERS_DIRECTORY
ssh -i gemfire.pem ubuntu@$SERVER_2 ls $MEMBERS_DIRECTORY
