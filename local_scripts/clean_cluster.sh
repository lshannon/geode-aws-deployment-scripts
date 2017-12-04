#!/bin/bash
#######################################################################
# Runs locally to Stop and clean up a locally running Geode cluster
#######################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
echo "Cleaning Up Working Folders"
rm -fr ./locator
rm -fr ./serverA
rm -fr ./serverB
