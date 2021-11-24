# see https://stackoverflow.com/questions/58269375/how-to-install-packages-with-miniconda-in-dockerfile
# and https://towardsdatascience.com/conda-pip-and-docker-ftw-d64fe638dc45
FROM ubuntu:20.04

SHELL [ "/bin/bash", "--login", "-c" ]

ARG uid=1000
ARG gid=100
ENV USER cantera
ENV HOME /home/${USER}
ENV UID ${uid}
ENV GID ${gid}
ENV SUNDIALS_VERSION 5.7
ENV PYTHON_VERSION 3.8

RUN apt-get update

# Install Apt dependencies
RUN apt-get update && apt-get install -y \
        build-essential gfortran \
        csh sudo git nano wget

RUN rm -rf /var/lib/apt/lists/*

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

# install miniconda
ENV CONDA_DIR ${HOME}/miniconda3
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    -O ~/miniconda.sh \
    && chmod +x ~/miniconda.sh
RUN ~/miniconda.sh -b -p ${CONDA_DIR} \
    && rm ~/miniconda.sh

# make non-activate conda commands available
ENV PATH=${CONDA_DIR}/bin:${PATH}

# make conda activate command available from /bin/bash --login shells
RUN echo ". ${CONDA_DIR}/etc/profile.d/conda.sh" >> ~/.profile

# make conda activate command available from /bin/bash --interative shells
RUN conda init bash

# install mamba
RUN conda install -c conda-forge -q -y mamba

# install dependencies
RUN mamba install -c conda-forge -q -y \
    python=${PYTHON_VERSION} \
    sundials=${SUNDIALS_VERSION} \
    scons numpy ruamel.yaml cython \
    boost-cpp fmt eigen yaml-cpp h5py pandas libgomp openblas \
    ipython pip

WORKDIR /home/docker

# finish installation
RUN echo alias python=python3 >> ${HOME}/.bashrc
#RUN echo export PATH="/home/docker/.local/bin:${PATH}" >> /home/docker/.bashrc
