# Oracle Java 7 for Ubuntu 14.04
#
# GitHub - http://github.com/dalekurt/docker-java7
# Docker Hub - http://hub.docker.com/u/dalekurt/java7
# Twitter - http://www.twitter.com/dalekurt


# Latest Ubuntu LTS from stackbrew
FROM aviata/base-2
MAINTAINER jmarsh.ext "jmarsh.ext@aviatainc.com"

# Add Repository
#RUN \
#    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
#    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
#    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
#    apt-get update  && \

# Install Java
#RUN \
#    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
#    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
#    DEBIAN_FRONTEND=noninteractive  apt-get install -y --force-yes oracle-java7-installer oracle-java7-set-default  && \

# Clean up
#RUN \
#    rm -rf /var/cache/oracle-jdk7-installer  && \
#    apt-get clean  && \
#    rm -rf /var/lib/apt/lists/*

# define default command
#CMD ["java"]

# Based on dockerfile/java : https://github.com/dockerfile/java/blob/master/oracle-java7/Dockerfile

# NOTE: apt-get install -y software-properties-common && \ should be moved to a shared base image.

# Install Java.
RUN \
  apt-get install -y software-properties-common && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Define default command.
CMD ["bash"]
