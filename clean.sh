#!/bin/bash

docker stop nicokosi-jenkins jenkins-docker
docker rm nicokosi-jenkins jenkins-docker
docker network rm jenkins
