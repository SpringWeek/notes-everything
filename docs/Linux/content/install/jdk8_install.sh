#!/bin/bash

# https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html


echo "check the jdk file...."
if [ -a "jdk-8u*-linux-x64.tar.gz" ];then
        echo "found docker install file"
else
        echo "can't find jdk 8 install file. Please download it in the following url."
        echo "https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"     
fi


# JAVA_HOME_VAR=/apps
# rpm -qa|grep java | grep openjdk | grep -v grep | xargs -r yum -y remove
# rpm -qa|grep java | grep openjdk | grep -v grep | xargs -r yum -y remove

# mkdir -p $JAVA_HOME_VAR

# tar -xzvf jdk-*-linux-x64.tar.gz -C /apps/
# ln -s /apps/jdk* /apps/jdk

# sed -i '/JAVA_HOME_VAR/'d /etc/profile 
# sed -i '/JAVA_HOME_PATH/'d /etc/profile 

# echo "export JAVA_HOME=${JAVA_HOME_VAR}/jdk   # JAVA_HOME_VAR"  >> /etc/profile
# echo "export PATH=\$JAVA_HOME/bin:\$PATH   # JAVA_HOME_PATH"  >> /etc/profile

# source /etc/profile