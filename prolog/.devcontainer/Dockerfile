FROM mcr.microsoft.com/vscode/devcontainers/base

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    inotify-tools
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential

ARG PROLOG_VERSION=1.5.0
ADD http://www.gprolog.org/gprolog-${PROLOG_VERSION}.tar.gz /tmp
RUN cd /tmp && tar -xvvf gprolog-${PROLOG_VERSION}.tar.gz
RUN cd /tmp/gprolog-${PROLOG_VERSION}/src && ./configure && make && make install && make check

COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

USER vscode
ENV HOME=/home/vscode

RUN echo 'export PS1="$ "' >> $HOME/.bashrc
