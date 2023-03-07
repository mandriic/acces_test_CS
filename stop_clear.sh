#!/bin/bash
#This script will stop and remove all containers and images when the test is finished, no is necessary to run it manually.
#Variable change in compil.sh
SEC=1800
if [ "$1" == "sleep" ] > /dev/null ; then
    sleep $SEC
fi
clear
#Stop and remove all containers and images of cybernet
docker stop client  > /dev/null 2>&1 && docker rm client > /dev/null 2>&1
docker stop dns > /dev/null 2>&1 && docker rm dns > /dev/null 2>&1
docker stop web > /dev/null 2>&1 && docker rm web > /dev/null 2>&1
docker rm $(docker ps -a --filter network=cybernet -q) > /dev/null 2>&1
#docker rmi $(docker images --filter=reference='mandriic/*:*' -q) > /dev/null 2>&1
#rm -f ./finish.me
rm -rf ../bin/
sleep 1
echo "Test was finished."


