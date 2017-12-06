#!/bin/bash
###############################################################################
# Stops all the members in the remote Cluster (including the Locator)
###############################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
LOCATOR_1=$(sed -n '1p' < locators.txt)
echo "To Shutdown the cluster run the following commands:"

gfsh -e "connect --locator=$LOCATOR_1[10334]" -e "shutdown --include-locators"
