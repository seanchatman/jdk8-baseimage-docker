FROM phusion/baseimage:0.9.13
MAINTAINER Sean Chatman <xpointsh@gmail.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

##### Installing JDK 8 #####

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update

# auto accept oracle jdk license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer ca-certificates oracle-java8-set-default

RUN echo "/usr/lib/jvm/java-8-oracle" > /etc/container_environment/JAVA_HOME

# Clean up when done.
RUN apt-get clean && rm -rf /tmp/* /var/tmp/*
