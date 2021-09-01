# create new image
FROM ubuntu-toolchain:latest
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"

ARG USER_ID
ARG GROUP_ID

# add user
RUN addgroup --gid $GROUP_ID docker
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID docker
RUN mkdir -p /home/docker && chown docker:docker /home/docker
USER docker

WORKDIR /home/docker

# Upgrade pip & install Python dependencies
RUN python3 -m pip install --no-warn-script-location --upgrade pip
RUN python3 -m pip install --no-warn-script-location setuptools wheel
RUN python3 -m pip install --no-warn-script-location ruamel.yaml scons numpy cython h5py pandas pytest ipython scipy

# finish installation
RUN echo alias python=python3 >> /home/docker/.bashrc
RUN echo export PATH="/home/docker/.local/bin:$PATH" >> /home/docker/.bashrc
