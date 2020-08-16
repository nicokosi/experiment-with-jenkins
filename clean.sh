#!/bin/bash

echo "Stop and remove Docker containers..."
docker stop nicokosi-jenkins jenkins-docker
docker rm nicokosi-jenkins jenkins-docker

echo "Stop and remove Docker network..."
docker network rm jenkins

echo "Stop and remove Docker volumes..."
docker volume rm jenkins-docker-certs jenkins-data

echo "Done! ✅"