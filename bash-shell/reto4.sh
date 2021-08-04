# !/bin/bash

echo "Generating log life..."
touch log.txt

echo "Registering login..."
user=$USER
date=$(date +%Y_%m_%d__%H:%M:%S)

echo "$user/$date" >> log.txt


sleep 1

echo -e "Login Registered \n"
cat log.txt

