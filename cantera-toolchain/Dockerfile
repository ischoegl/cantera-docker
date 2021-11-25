# Ubuntu 20.04 LTS linux is used for this project
FROM ubuntu:20.04
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"
SHELL [ "/bin/bash", "--login", "-c" ]

ARG DEBIAN_FRONTEND=noninteractive
ARG user=cantera
ARG uid=1000
ARG gid=100
ARG cython=old
ENV USER ${user}
ENV HOME /home/${USER}
ENV UID ${uid}
ENV GID ${gid}

# Install Apt dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-pip build-essential gfortran \
    software-properties-common \
    libboost-dev liblapack-dev libblas-dev \
    csh sudo git nano

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
RUN python3 -m pip install --no-warn-script-location ruamel.yaml scons numpy h5py pandas ipython pytest;

# Install cython
RUN if [ ${cython} == "new" ]; \
    then python3 -m pip install --no-warn-script-location \
        https://github.com/cython/cython/archive/master.zip \
        --install-option='--no-cython-compile'; \
    else python3 -m pip install --no-warn-script-location cython; \
    fi

WORKDIR ${HOME}

RUN echo alias python=python3 >> ${HOME}/.bashrc
RUN echo export PATH="${HOME}/.local/bin:${PATH}" >> ${HOME}/.bashrc
