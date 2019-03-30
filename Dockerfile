# Alpine linux is lightweight and sufficient for this project
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
	python3 \
	python3-numpy \
	python3-numpy-dev \
	python3-setuptools \
	cython3 \
	libboost-dev 

WORKDIR /work/
COPY . /work/

# clone cantera repository
RUN git clone https://github.com/Cantera/cantera.git
#RUN mv cantera.conf cantera/