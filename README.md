# Experiment with Jenkins

A [Jenkins](https://www.jenkins.io) instance configured with the [`Configuration as Code` plugin](https://github.com/jenkinsci/configuration-as-code-plugin).

## Run locally

Pre-requisite: [Docker](https://www.docker.com/products/docker-desktop) is installed.

Run:

```shell
docker build . --tag experimental-jenkins
docker run \
    --privileged \
    --publish 8080:8080 \
    --publish 50000:50000 \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    experimental-jenkins
```

Then browse http://localhost:8080.
