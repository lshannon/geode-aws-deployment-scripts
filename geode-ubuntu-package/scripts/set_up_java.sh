#!/bin/bash
#############################################################
# Set up Java on the remote machines
#############################################################
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# Download Java And Set It Up
wget --quiet --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz
mkdir /home/ubuntu/jdk
tar -zxf ./jdk-8u151-linux-x64.tar.gz -C /home/ubuntu/jdk
rm jdk-8u151-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /home/ubuntu/jdk/jdk1.8.0_151/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac /home/ubuntu/jdk/jdk1.8.0_151/bin/javac 100
