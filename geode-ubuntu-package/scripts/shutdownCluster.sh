#!/bin/bash
##########################################################################
# Runs on the remote machine. Uses gfsh to call a gfsh shut down script
##########################################################################

source /home/ubuntu/cluster/gemfire-ubuntu-package/scripts/setenv.sh
gfsh run --file=/home/ubuntu/cluster/gemfire-ubuntu-package/scripts/shutdown-all.gf
