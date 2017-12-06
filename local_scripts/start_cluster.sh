#!/bin/bash
##############################################################################
# Runs locally using `gfsh` to start Geode processes (1 Locators, 2 Servers)
##############################################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source set_env.sh

echo "Starting up 1 Locator and 2 Servers locally"
#Check if a working directory needs to be made
if [ ! -d "$SERVER_DIR_LOCATION/$LOCATOR" ]; then
	mkdir $SERVER_DIR_LOCATION/$LOCATOR
fi

#Start the Locator processes
gfsh start locator --name=$LOCATOR \
	--enable-cluster-configuration=false  \
	--dir=$SERVER_DIR_LOCATION/$LOCATOR \
	--port=$LOCATOR_PORT \
	--log-level=config \
	--J=-Xms256m \
	--J=-Xmx256m \
	--J=-Dcom.sun.management.jmxremote \
	--J=-Dcom.sun.management.jmxremote.port=15666 \
	--J=-Dcom.sun.management.jmxremote.ssl=false \
	--J=-Dcom.sun.management.jmxremote.authenticate=false \
	--J=-Dcom.sun.management.jmxremote.local.only=false
echo "Locator started"

#Start Server loop
for N in 1 2 ; do

	 # Figure out the name
   if [[ $N == "1" ]] ; then
      NAME="serverA"
   elif [[ $N == "2" ]] ; then
      NAME="serverB"
   fi

	 #Create the working director if required
   if [ ! -d $SERVER_DIR_LOCATION/$NAME ]; then
		 mkdir $SERVER_DIR_LOCATION/$NAME
   fi

	 #Set the port (incremented from 8080 for each server)
   HTTP_PORT=$(( 8080 + $N ))

#Don't touch this spacing
gfsh start server \
   --name=$NAME \
   --use-cluster-configuration=false \
   --classpath=$CLASSPATH \
   --server-port=0 \
   --dir=$SERVER_DIR_LOCATION/$NAME \
   --locators=$LOCATOR_IP[$LOCATOR_PORT] \
   --J=-Dgemfire.http-service-port=$HTTP_PORT \
   --J=-Dgemfire.start-dev-rest-api=true \
   --J=-Xms256m \
   --J=-Xmx256m

echo "Started Server $NAME"
#Close the server start loop
done

#Connect to `gfsh` locally and get the members
gfsh -e connect -e "list members"

echo "Local Cluster started"
