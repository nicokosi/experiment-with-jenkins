FROM jenkins/jenkins:lts

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
