FROM docker.io/ubuntu:20.04

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install sudo -y

ENV USERPASSWORD=password
RUN useradd \
      -m user \
      -s /bin/bash \
      -G sudo \
      -p $(perl -e 'print crypt($ARGV[0], "password")' "$USERPASSWORD")

USER user
WORKDIR /home/user
ENTRYPOINT /bin/bash
