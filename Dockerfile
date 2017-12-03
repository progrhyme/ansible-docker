FROM debian:9.2
MAINTAINER progrhyme <progrhyme@gmail.com>

# Install prerequisites
RUN apt-get update \
 && apt-get -y install gnupg

# http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-debian
RUN echo \
      "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" \
      >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

ENV ANSIBLE_VERSION 2.4.2.0-1ppa~trusty

RUN apt-get update \
 && apt-get -y install ansible=${ANSIBLE_VERSION} \
 && rm -rf /var/lib/apt/lists/*

CMD ["ansible-playbook", "--version"]
