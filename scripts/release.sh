#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No GIT username or password supplied as argument"
    exit;
fi

while true; do
    read -p "Do you wish to release [y/n]? " yn
    case $yn in
        [Yy]* ) mvn release:clean release:prepare release:perform -Dusername=$1 -Dpassword=$2; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

mvn release:perform
#mvn -B release:prepare -Dusername=$1 -Dpassword=$2 && mvn release:perform
