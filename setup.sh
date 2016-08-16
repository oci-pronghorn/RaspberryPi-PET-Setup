#!/bin/bash

sudo apt-get update

#install maven
sudo apt-get --assume-yes install maven

#copy workspace
cp -R javaLessons ~/javaLessons

#hook into the system once and we have all the needed resources
mvn -s ./settings.xml archetype:generate -DarchetypeGroupId=com.ociweb.iot.archetype -DarchetypeArtifactId=PronghornIoT-Archetype -DarchetypeVersion=0.0.3 -DgroupId=com.dexterindustries.grovepi.project -DartifactId=setupValidator -Dversion=1.0-SNAPSHOT -Dpackage=com.dexterindustries.grovepi.project.setupValidator -DinteractiveMode=false -DarchetypeRepository=https://repository-pronghorn.forge.cloudbees.com/release


cd setupValidator
mvn install
cd ..

#adding helper script to root of user folder
#cp ./createProject.sh ~/createProject.sh




