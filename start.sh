#! /bin/bash
# Variables for TAGS of docker images
ver_client=add_hints
ver_dns=2
ver_web=malaga_test
#---------------------------------
# Stop and remove all containers, if they exist
docker stop client  > /dev/null 2>&1 && docker rm client > /dev/null 2>&1
docker stop dns > /dev/null 2>&1 && docker rm dns > /dev/null 2>&1
docker stop web > /dev/null 2>&1 && docker rm web > /dev/null 2>&1
#---------------------------------
# Remove all images, if they exist
docker network rm cybernet > /dev/null 2>&1
#---------------------------------
# Create network, and run containers
docker network create --subnet=10.42.42.0/24 cybernet > /dev/null 2>&1
#You can change --ip to set a static IP address for a container, but is necessary to change README.txt in client image
#You can change docker images to your own, rfm docker commit, docker tag and docker push.
docker run --net cybernet --ip 10.42.42.42 -itd --name client mandriic/clicyber:$ver_client > /dev/null 2>&1
docker run --net cybernet --ip 10.42.42.53 -itd --name dns mandriic/cyberdns:$ver_dns > /dev/null 2>&1
docker run --net cybernet --ip 10.42.42.80 -itd --name web mandriic/cyberweb:$ver_web > /dev/null 2>&1
sleep 1
docker exec -d web service nginx start
docker exec -d dns /etc/init.d/bind9 start
rm -f vm.bin

