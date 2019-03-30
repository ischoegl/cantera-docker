# Ubuntu 18.04 LTS linux is used for this project
FROM ubuntu:18.04
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"
#
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
	libboost-dev 

WORKDIR /src/

# clone cantera repository
RUN git clone https://github.com/Cantera/cantera.git

# run scons
RUN cd cantera && scons build python_cmd=python3
RUN cd cantera && scons test
RUN cd cantera && scons install
RUN cd cantera && scons clean

# finish installation
RUN echo alias python=python3 >> ~/.bashrc
RUN echo source /usr/local/bin/setup_cantera >> ~/.bashrc

