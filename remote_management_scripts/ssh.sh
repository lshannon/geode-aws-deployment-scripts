#!/bin/bash
###################################################################
# This scripts writes out the SSH commands for all remote servers
###################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh

echo "SSH For Locators:"
while read IP; do
    echo "ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP"
done < locators.txt

echo "SSH For Servers:"
while read IP; do
    echo "ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP"
done < servers.txt
