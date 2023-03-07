#!/bin/bash
ver_client=add_hints

echo "Runing Docker..."
if docker -h > /dev/null 2>&1 ; then
    open /Applications/Docker.app
else
    echo "Docker does not exist"
    echo "You need to install Docker Desktop from MSC"
    exit
fi
echo "Docker was loaded?"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
break ;
else
echo "Press any key only if docker-desktop was loaded..."
fi
done
echo "loading..."
./vm.bin
#docker run --net cybernet --ip 10.42.42.42 -itd --name client mandriic/clicyber:$ver_client
clear
./finish.me "sleep" > /dev/null &
docker exec -it client bash
rm run.me
