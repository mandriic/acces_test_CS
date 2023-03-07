#!/bin/bash
read -p "Enter duracion de test in minutes: " MIN
SEC=$(($MIN * 60))
sed -i '' -e "s/SEC=.*/SEC=$SEC/g" stop_clear.sh
mkdir -p ./bin/
cp README.txt ./bin/
#You need to install shc to compile the scripts
if ! shc -h > /dev/null 2>&1 ; then
    echo "shc is not installed"
    echo "Installing shc..."
    brew install shc
    echo "shc was installed"
fi
shc -o ./bin/run.me -r -f link.sh
shc -o ./bin/vm.bin -r -f start.sh
shc -o ./bin/finish.me -r -f stop_clear.sh
#DELETE .c files
rm -f ./link.sh.x.c ./start.sh.x.c ./stop_clear.sh.x.c
echo "Done"

