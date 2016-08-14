#!/usr/bin/bash

sudo apt-get update

#install maven
sudo apt-get install maven

#copy workspace
cp -R workspace ~/workspace

#project contains 'settings.xml'.  The repositories found within should be place
#inside the ~\.m2\settings.xml file. The steps below however preload the jars and 
#makes that superfluous

#hook into the sysem once and we have all the needed resources
mvn -gs ./settings.xml archetype:generate -DarchetypeGroupId=com.ociweb.iot.archetype -DarchetypeArtifactId=PronghornIoT-Archetype -DarchetypeVersion=0.0.1 -DgroupId=com.dexterindustries.grovepi.project -DartifactId=setupValidator -Dversion=1.0-SNAPSHOT -Dpackage=com.dexterindustries.grovepi.project.setupValidator -DinteractiveMode=false

cd setupValidator
mvn install
cd ..

#adding helper script to root of user folder
cp ./createProject.sh ~/createProject.sh




