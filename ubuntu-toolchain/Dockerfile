# Ubuntu 18.04 LTS linux is used for this project
FROM ubuntu:18.04
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"
#
RUN apt-get update && apt-get install -y \
	build-essential \
	cmake	\
	git \
	scons \
	nano \
	cython python-dev python-numpy python-numpy-dev python-setuptools \
	python3 python3-dev \
	cython3 python3-numpy python3-numpy-dev python3-setuptools \
	python3-pip \
	libboost-dev \
	valgrind \
	ipython3 \
	python3-scipy

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-matplotlib 

# finish installation
RUN echo alias python=python3 >> ~/.bashrc
RUN echo alias pip=pip3 >> ~/.bashrc
RUN echo alias ipython=ipython3 >> ~/.bashrc

# update pip
RUN pip3 install --upgrade pip
#RUN pip3 install matplotlib
#RUN pip3 install scipy
