#!/bin/bash
###############################################################################
# Stops all the members in the remote Cluster (including the Locator)
###############################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
LOCATOR_1=$(sed -n '1p' < locators.txt)
IP="$(echo $LOCATOR_1 | cut -d ' ' -f 1)"
echo "To Connection: connect --locator=$IP[10334]"
$LOCAL_GEODE/bin/gfsh
