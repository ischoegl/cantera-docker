# create new image
FROM cantera-src:latest
MAINTAINER "Ingmar Schoegl <ischoegl@gmail.com>"

# create non-root user
RUN groupadd -g 999 ctuser && \
    useradd -r -u 999 -g ctuser ctuser
RUN mkdir -p /home/ctuser && \
    chown -R ctuser:ctuser /home/ctuser
USER ctuser

WORKDIR /home/ctuser/

# finish installation
RUN echo alias python=python3 >> ~/.bashrc
RUN echo alias pip=pip3 >> ~/.bashrc
RUN echo source /usr/local/bin/setup_cantera >> ~/.bashrc

## link python example folder
RUN cp -r /usr/local/lib/python3.6/dist-packages/cantera/examples .python-examples
