FROM jenkins/jenkins:lts

COPY casc /var/lib/jenkins/casc
ENV CASC_JENKINS_CONFIG /var/lib/jenkins/casc

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt