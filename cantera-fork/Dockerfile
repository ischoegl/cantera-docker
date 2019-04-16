# Ubuntu 18.04 LTS linux is used for this project
FROM ubuntu-toolchain:latest
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"
#
WORKDIR /src/
COPY cantera.tar.gz /src/
RUN tar xvzf cantera.tar.gz

# # run scons
RUN cd cantera && scons build
RUN cd cantera && scons test
RUN cd cantera && scons install

## finish installation
RUN echo source /usr/local/bin/setup_cantera >> ~/.bashrc

