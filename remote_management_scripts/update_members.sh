#!/bin/bash
##################################################################
# This uploads/updates all required files to the remote servers
##################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh
echo "What to update? (NOTE: Need to have ran setup first)"
echo "1: 'geode-ubuntu-package'"
echo "2: 'scripts' folder"
echo "3: 'conf' folder"
echo "4: 'lib' folder"
read option
if [[ ("$option" -eq "1") ]]; then
	echo "Uploading the 'geode-ubuntu-package' to all servers"
	echo "Uploading to Locator 1"
	scp -r -i gemfire.pem geode-ubuntu-package ubuntu@$LOCATOR_SERVER_1:$BASE_DIRECTORY
	echo "Uploading to Locator 2"
	scp -r -i gemfire.pem geode-ubuntu-package ubuntu@$LOCATOR_SERVER_2:$BASE_DIRECTORY
	echo "Uploading to Server 1"
	scp -r -i gemfire.pem geode-ubuntu-package ubuntu@$SERVER_1:$BASE_DIRECTORY
	echo "Uploading to Server 2"
	scp -r -i gemfire.pem geode-ubuntu-package ubuntu@$SERVER_2:$BASE_DIRECTORY
fi
if [[ ("$option" -eq "2") ]]; then
	echo "Uploading the 'scripts' folder to all servers"
	echo "Uploading to Locator 1"
	scp -r -i gemfire.pem geode-ubuntu-package/scripts ubuntu@$LOCATOR_SERVER_1:$PACKAGE_DIRECTORY
	echo "Uploading to Locator 2"
	scp -r -i gemfire.pem geode-ubuntu-package/scripts ubuntu@$LOCATOR_SERVER_2:$PACKAGE_DIRECTORY
	echo "Uploading to Server 1"
	scp -r -i gemfire.pem geode-ubuntu-package/scripts ubuntu@$SERVER_1:$PACKAGE_DIRECTORY
	echo "Uploading to Server 2"
	scp -r -i gemfire.pem geode-ubuntu-package/scripts ubuntu@$SERVER_2:$PACKAGE_DIRECTORY
fi
if [[ ("$option" -eq "3") ]]; then
	echo "Uploading the 'conf' to all servers"
	echo "Uploading to Locator 1"
	scp -r -i gemfire.pem geode-ubuntu-package/conf ubuntu@$LOCATOR_SERVER_1:$PACKAGE_DIRECTORY
	echo "Uploading to Locator 2"
	scp -r -i gemfire.pem geode-ubuntu-package/conf ubuntu@$LOCATOR_SERVER_2:$PACKAGE_DIRECTORY
	echo "Uploading to Server 1"
	scp -r -i gemfire.pem geode-ubuntu-package/conf ubuntu@$SERVER_1:$PACKAGE_DIRECTORY
	echo "Uploading to Server 2"
	scp -r -i gemfire.pem geode-ubuntu-package/conf ubuntu@$SERVER_2:$PACKAGE_DIRECTORY
fi
if [[ ("$option" -eq "4") ]]; then
	echo "Uploading the 'lib' to all servers"
	echo "Uploading to Locator 1"
	scp -r -i gemfire.pem geode-ubuntu-package/lib ubuntu@$LOCATOR_SERVER_1:$PACKAGE_DIRECTORY
	echo "Uploading to Locator 2"
	scp -r -i gemfire.pem geode-ubuntu-package/lib ubuntu@$LOCATOR_SERVER_2:$PACKAGE_DIRECTORY
	echo "Uploading to Server 1"
	scp -r -i gemfire.pem geode-ubuntu-package/lib ubuntu@$SERVER_1:$PACKAGE_DIRECTORY
	echo "Uploading to Server 2"
	scp -r -i gemfire.pem geode-ubuntu-package/lib ubuntu@$SERVER_2:$PACKAGE_DIRECTORY
fi
echo "Done!"
