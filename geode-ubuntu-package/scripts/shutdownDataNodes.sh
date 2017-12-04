#!/bin/bash
##########################################################################
# Runs on the remote machine. Uses gfsh to call a gfsh shut down script
# This results in all members being shut down but the locators
##########################################################################

source /home/ubuntu/cluster/gemfire-ubuntu-package/scripts/setenv.sh
gfsh run --file=/home/ubuntu/cluster/gemfire-ubuntu-package/scripts/shutdown.gf
