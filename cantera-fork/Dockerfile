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

#RUN mkdir -p /src
WORKDIR /home/docker

# finish installation
#RUN echo alias python=python3 >> /home/docker/.bashrc
