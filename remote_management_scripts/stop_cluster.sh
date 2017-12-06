#!/bin/bash
###############################################################################
# Stops all the members in the remote Cluster (including the Locator)
###############################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
LOCATOR_1=$(sed -n '1p' < locators.txt)
IP="$(echo $LOCATOR_1 | cut -d ' ' -f 1)"
echo "+++++++++++++++++"
echo "What to Shutdown?"
echo "+++++++++++++++++"
echo "1: Everything"
echo "2: Data Nodes Only"
echo "---------------"
read option

if [[ ("$option" -eq "1") ]]; then
		gfsh -e "connect --locator=$IP[10334]" -e "shutdown --include-locators=true"
fi

if [[ ("$option" -eq "2") ]]; then
		gfsh -e "connect --locator=$IP[10334]" -e "shutdown --include-locators=false"
fi
