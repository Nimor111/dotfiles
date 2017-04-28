#/bin/bash

sudo rm /var/run/docker.pid
sudo systemctl stop docker.service
sudo docker daemon -s overlay &
