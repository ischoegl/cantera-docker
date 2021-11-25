# Ubuntu 20.04 LTS linux is used for this project
FROM ubuntu:20.04
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"
SHELL [ "/bin/bash", "--login", "-c" ]

ARG DEBIAN_FRONTEND=noninteractive
ARG user=cantera
ARG uid=1000
ARG gid=100
ENV USER ${user}
ENV HOME /home/${USER}
ENV UID ${uid}
ENV GID ${gid}

# Install wget
RUN apt-get update && apt-get install -y wget gpg

# get intel repository
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB \
    && apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB \
    && rm GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB

RUN echo "deb https://apt.repos.intel.com/oneapi all main" | tee /etc/apt/sources.list.d/oneAPI.list

# Install Apt dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-pip build-essential gfortran \
    software-properties-common \
    libboost-dev liblapack-dev libblas-dev \
    csh sudo git nano \
    intel-oneapi-compiler-fortran intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic intel-oneapi-mpi \
    intel-oneapi-mpi-devel intel-oneapi-mkl ninja-build

# add group (if it doesn't exist)
RUN if [ "$(getent group ${GID})" ]; \
    then echo "Group exists"; \
    else addgroup --gid ${GID} docker; \
    fi

# add user
RUN adduser --disabled-password \
    --gecos "Non-root user" \
    --uid ${UID} \
    --gid ${GID} \
    --home ${HOME} \
    ${USER}

USER ${USER}

# Upgrade pip
RUN python3 -m pip install --no-warn-script-location --upgrade pip setuptools wheel

# Install Python dependencies
RUN python3 -m pip install --no-warn-script-location ruamel.yaml scons numpy h5py pandas ipython pytest cython;

WORKDIR ${HOME}

RUN echo alias python=python3 >> ${HOME}/.bashrc
RUN echo export PATH="${HOME}/.local/bin:${PATH}" >> ${HOME}/.bashrc
RUN echo source /opt/intel/oneapi/setvars.sh >> ${HOME}/.bashrc
