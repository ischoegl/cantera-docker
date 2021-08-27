# Ubuntu 18.04 LTS linux is used for this project
FROM ubuntu:20.04
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"
#
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        build-essential \
        cmake scons \
        git wget \
        csh \
        nano \
        cython python-dev python-numpy python-numpy-dev python-setuptools \
        python3 python3-dev \
        cython3 python3-numpy python3-numpy-dev python3-setuptools \
        python3-pip python3-ruamel.yaml \
        libboost-dev libblas-dev liblapack-dev \
        valgrind \
        ipython3 \
        python3-scipy \
        gfortran

RUN apt-get install -y python3-matplotlib

RUN apt-get install -y sudo

# finish installation
#RUN echo alias python=python3 >> ~/.bashrc

# update pip
RUN pip install --upgrade pip
RUN pip install pytest h5py
