FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:openjdk-r/ppa \
    && apt-get update \
    && apt-get install openjdk-8-jdk git -y

RUN useradd -d /var/lib/jenkins jenkins \
    && ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa \
    && mkdir /var/lib/jenkins \
    && mkdir /var/lib/jenkins/.ssh \
    && cat /root/.ssh/id_rsa.pub > /var/lib/jenkins/.ssh/authorized_keys \
    && mkdir /var/jenkins0 \
    && chmod 777 /var/jenkins0

RUN cat /root/.ssh/id_rsa.pub
