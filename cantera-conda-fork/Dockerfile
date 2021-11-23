# see https://stackoverflow.com/questions/58269375/how-to-install-packages-with-miniconda-in-dockerfile
# and https://towardsdatascience.com/conda-pip-and-docker-ftw-d64fe638dc45
FROM ubuntu:20.04

SHELL [ "/bin/bash", "--login", "-c" ]

ARG USER_ID
ARG GROUP_ID
ENV USER docker
ENV HOME /home/${USER}

RUN apt-get update

# Install Apt dependencies
RUN apt-get update && apt-get install -y \
        build-essential gfortran \
        csh sudo git nano wget

RUN rm -rf /var/lib/apt/lists/*

# add user
RUN addgroup --gid ${GROUP_ID} docker
RUN adduser --disabled-password \
    --gecos "Non-root user" \
    --uid ${USER_ID} \
    --gid ${GROUP_ID} \
    --home ${HOME} \
    ${USER}

USER ${USER}

RUN pwd

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

# install dependencies (including sundials 5.7}
RUN mamba install -c conda-forge -q -y \
    sundials=5.7 \
    scons numpy ruamel.yaml \
    boost-cpp fmt eigen yaml-cpp h5py pandas libgomp openblas \
    ipython pip

# Upgrade pip & install Python dependencies
RUN python3 -m pip install --no-warn-script-location --upgrade pip

# pre-release version of Cython
RUN python3 -m pip install --no-warn-script-location \
    https://github.com/cython/cython/archive/master.zip \
    --install-option='--no-cython-compile'

WORKDIR /home/docker

# finish installation
#RUN echo alias python=python3 >> /home/docker/.bashrc
#RUN echo export PATH="/home/docker/.local/bin:${PATH}" >> /home/docker/.bashrc
