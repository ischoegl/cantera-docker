# create new image
FROM ubuntu-toolchain:latest
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"

# add user
RUN groupadd -g 1000 docker
RUN useradd -u 1000 -g docker docker
RUN mkdir -p /home/docker && chown docker:docker /home/docker
USER docker

#RUN mkdir -p /src
WORKDIR /home/docker

# finish installation
RUN echo alias python=python3 >> /home/docker/.bashrc
RUN echo alias pip=pip3 >> /home/docker/.bashrc
RUN echo alias ipython=ipython3 >> /home/docker/.bashrc
RUN echo source /usr/local/bin/setup_cantera >> /home/docker/.bashrc
