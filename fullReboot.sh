#!/usr/bin/env bash

path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd $path

echo "Cytomine is restarting..."
echo "1/ Stop running containers..."
bash stop.sh

echo "2/ Init..."
bash init.sh


echo "3/ Launch new containers..."
bash start.sh