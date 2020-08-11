# Experiment with Jenkins

## Run locally

Pre-requisite: Docker is installed.

1. run `./install.sh`
2. copy password via `docker exec -it nicokosi-jenkins bash` then `cat /var/jenkins_home/secrets/initialAdminPassword ; exit`
3. browse http://localhost:8080/ and paste password
