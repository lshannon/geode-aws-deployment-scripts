#!/bin/bash
##################################################################
# This uploads/updates all required files to the remote servers
##################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
echo "What to update? (NOTE: Need to have ran 'intial-setup.sh' first)"
echo "1: 'geode-ubuntu-package'"
echo "2: Update 'scripts' folder"
echo "3: Update Cluster Configs"
echo "4: Update 'lib' folder"
read option
if [[ ("$option" -eq "1") ]]; then

	echo "Uploading the 'geode-ubuntu-package' on all the Locators"
	while read IP; do
	    scp -rC -i $LOCAL_AWS_PEM_LOCATION ../geode-ubuntu-package ubuntu@$IP:$REMOTE_BASE_DIRECTORY < /dev/null
	done < locators.txt

	echo "Uploading the ''geode-ubuntu-package' on all the Servers"
	while read IP; do
	    scp -rC -i $LOCAL_AWS_PEM_LOCATION ../geode-ubuntu-package ubuntu@$IP:$REMOTE_BASE_DIRECTORY < /dev/null
	done < servers.txt

fi
if [[ ("$option" -eq "2") ]]; then

	echo "Uploading the 'scripts' directory to the Locators"
	while read IP; do
		echo "Updating Locator: $IP"
		{
			scp -r -i $LOCAL_AWS_PEM_LOCATION ../geode-ubuntu-package/scripts ubuntu@$IP:$REMOTE_SCRIPTS_DIRECTORY
		} < /dev/null
	done < locators.txt

	echo "Uploading the 'scripts' directory to all the Servers"
	while read IP; do
		echo "Updating Server: $IP"
		{
			scp -r -i $LOCAL_AWS_PEM_LOCATION ../geode-ubuntu-package/scripts ubuntu@$IP:$REMOTE_SCRIPTS_DIRECTORY
		} < /dev/null
	done < servers.txt

fi
if [[ ("$option" -eq "3") ]]; then

	echo "Uploading the 'conf' to all servers"

fi
if [[ ("$option" -eq "4") ]]; then

	echo "Uploading the 'lib' to all servers"

fi
echo "Done!"
