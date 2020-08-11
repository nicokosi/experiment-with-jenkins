FROM jenkins/jenkins:lts
RUN /usr/local/bin/install-plugins.sh \
      adoptopenjdk \
      configuration-as-code \
      credentials \
      docker-plugin \
      docker-workflow \
      github \
      jdk-tool \
      job-dsl \
      plain-credentials \
      workflow-aggregator \
      workflow-multibranch

COPY ./casc /var/jenkins_home/casc_config
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_config
ENV GITHUB_TOKEN=""
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
