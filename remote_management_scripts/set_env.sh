#!/bin/bash
#############################################################
# This scripts everything locally to run to use `gfsh` to
# connect to the remote cluster locator.
#############################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Make sure there is a PEM location
if [[ -z "${LOCAL_AWS_PEM_LOCATION}" ]]; then
  echo "Please set an Environmental variable containing the location of AWS *.pem file to access the EC2 machines:"
  echo "Example: 'export LOCAL_AWS_PEM_LOCATION=/somefolder/geode.pem' and then re-run this script."
  echo "Press any key to terminate this script"
  read anykey
  exit 1
fi

# If JAVA_HOME is set so JAVA_HOME can be used
if [ -n $JAVA_HOME ]; then
  export REMOTE_BASE_DIRECTORY=/home/ubuntu/geode/cluster
  export REMOTE_GEMFIRE_DIRECTORY=$REMOTE_BASE_DIRECTORY/geode-ubuntu-package
  export REMOTE_LIB_DIRECTORY=$REMOTE_GEMFIRE_DIRECTORY/lib
  export REMOTE_SCRIPTS_DIRECTORY=$REMOTE_GEMFIRE_DIRECTORY/scripts
  export REMOTE_MEMBERS_DIRECTORY=$REMOTE_BASE_DIRECTORY/members
  export REMOTE_CONFIGURATION_DIRECTORY=$REMOTE_BASE_DIRECTORY/conf
  export LOCAL_GEODE=../geode-ubuntu-package/apache-geode
  export PATH=$PATH:$JAVA_HOME/bin:$LOCAL_GEODE/bin
else
  echo "This requires the Java JDK and JAVA_HOME to be set"
	echo "Geode currently supports: http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"
	echo "If you already have the JDK, trying running 'export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)' and then running this script."
	echo "Press any key to terminate this script"
	read anykey
	exit 1
fi
