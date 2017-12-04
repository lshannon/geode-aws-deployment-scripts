#!/bin/bash
##############################################################################
# Runs locally to start 'gfsh' to manage the local cluster
##############################################################################
source set_env.sh
echo "Gemfire Shell (gfsh) is command-line interface to launch, manage and monitor Gemfire processes"
echo "Type connect to connect to the grid if its running"
gfsh
