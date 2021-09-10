# Ubuntu 18.04 LTS linux is used for this project
FROM ubuntu:20.04
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"
#
ARG DEBIAN_FRONTEND=noninteractive

# Install Apt dependencies
RUN apt-get update && apt-get install -y \
        libboost-dev gfortran \
        software-properties-common \
        csh sudo git nano

RUN apt-get install -y \
        python3 python3-pip build-essential

# finish installation
RUN echo alias python=python3 >> ~/.bashrc
