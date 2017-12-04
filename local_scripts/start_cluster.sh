#!/bin/bash
##############################################################################
# Runs locally using `gfsh` to start Geode processes (2 Locators, 2 Servers)
##############################################################################
source ./environment.sh

if [ ! -d "$SERVER_DIR_LOCATION/$LOCATOR_1" ]; then
	mkdir $SERVER_DIR_LOCATION/$LOCATOR_1
fi
if [ ! -d "$SERVER_DIR_LOCATION/$LOCATOR_2" ]; then
	mkdir $SERVER_DIR_LOCATION/$LOCATOR_2
fi

echo "Starting Up: Locator A, Locator B and Server A, Server B, Server C and Server D"
gfsh start locator --name=$LOCATOR_1 \
   --enable-cluster-configuration=true  \
  --dir=$SERVER_DIR_LOCATION/$LOCATOR_1 \
  --port=$LOCATOR_PORT_1 \
  --log-level=config \
  --J=-Xms256m \
  --J=-Xmx256m \
  --J=-Dcom.sun.management.jmxremote \
  --J=-Dcom.sun.management.jmxremote.port=15666 \
  --J=-Dcom.sun.management.jmxremote.ssl=false \
  --J=-Dcom.sun.management.jmxremote.authenticate=false \
  --J=-Dcom.sun.management.jmxremote.local.only=false

gfsh start locator \
   --name=$LOCATOR_2 \
   --enable-cluster-configuration=false  \
   --dir=$SERVER_DIR_LOCATION/$LOCATOR_2 \
   --locators=$LOCATOR_IP[$LOCATOR_PORT_1],$LOCATOR_IP[$LOCATOR_PORT_2] \
   --port=$LOCATOR_PORT_2 \
   --log-level=config \
   --J=-Xms256m \
   --J=-Xmx256m \
   --J=-Dcom.sun.management.jmxremote \
   --J=-Dcom.sun.management.jmxremote.port=15667 \
   --J=-Dcom.sun.management.jmxremote.ssl=false \
   --J=-Dcom.sun.management.jmxremote.authenticate=false \
   --J=-Dcom.sun.management.jmxremote.local.only=false

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
   --locators=$LOCATOR_IP[$LOCATOR_PORT_1],$LOCATOR_IP[$LOCATOR_PORT_2] \
   --J=-Dgemfire.http-service-port=$HTTP_PORT \
   --J=-Dgemfire.start-dev-rest-api=true \
   --J=-Xms256m \
   --J=-Xmx256m \
   --properties-file=$CONF_DIR/gemfire.properties \
   --spring-xml-location=file:///$CONF_DIR/fastfootshoes-spring-cache.xml

#Close the server start loop
done

#Connect to `gfsh` locally and get the members
gfsh -e connect -e "list members"

echo "Local Cluster started"
