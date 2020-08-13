#!/bin/bash

# exit when any command fails
set -e

# 1. Build my own Docker image with needed plugins
docker build --tag nicokosi/jenkins .

# 2. Start Jenkins as Docker containers. Explanations: https://www.jenkins.io/doc/book/installing/#docker
docker network create jenkins

docker volume create jenkins-docker-certs
docker volume create jenkins-data

docker container run \
  --name jenkins-docker \
  --rm \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind

docker container run \
  --name nicokosi-jenkins \
  --rm \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client \
  nicokosi/jenkins

# 3. Then lock Jenkins: https://www.jenkins.io/doc/book/installing/#setup-wizard

# Configure plugins "as code" using configuration-as-code-plugin aka JCasC?
# https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos