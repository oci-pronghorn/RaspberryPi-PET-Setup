#!/bin/bash

sudo apt-get update

# install maven
wget http://mirrors.advancedhosters.com/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo tar -xvzf ./apache-maven-3.3.9-bin.tar.gz
sudo mv ./apache-maven-3.3.9 /opt
sudo ln -s /opt/apache-maven-3.3.9/bin/mvn /usr/bin/mvn
sudo ln -s /opt/apache-maven-3.3.9/bin/mvnDebug /usr/bin/mvnDebug
rm ./apache-maven-3.3.9-bin.tar.gz

# install geany ide
sudo apt-get --assume-yes install geany

# add mvn support
python ./geany_mvn_conf.py

# copy workspace
cp -R javaLessons ~/javaLessons

#hook into the system once and we have all the needed resources
mvn -s ./settings.xml archetype:generate -DarchetypeGroupId=com.ociweb.iot.archetype -DarchetypeArtifactId=PronghornIoT-Archetype -DarchetypeVersion=0.0.3 -DgroupId=com.dexterindustries.grovepi.project -DartifactId=setupValidator -Dversion=1.0-SNAPSHOT -Dpackage=com.dexterindustries.grovepi.project.setupValidator -DinteractiveMode=false -DarchetypeRepository=https://repository-pronghorn.forge.cloudbees.com/release

cd setupValidator
mvn install
cd ..

# adding helper script to root of user folder
#cp ./createProject.sh ~/createProject.sh
