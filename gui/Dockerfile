FROM centos
RUN yum install -y xeyes

RUN groupadd -g 1000 me
RUN useradd -u 1000 -g 1000 me

RUN mkdir -p /home/me && chown me:me /home/me

USER me

CMD ["/usr/bin/xeyes"]
