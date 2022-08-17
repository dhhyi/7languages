FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential

ADD http://www.gprolog.org/gprolog-1.5.0.tar.gz /tmp
RUN cd /tmp && tar -xvvf gprolog-1.5.0.tar.gz
RUN cd /tmp/gprolog-1.5.0/src && ./configure && make && make install && make check && gprolog --version

RUN echo 'export PS1="$ "\ngprolog --version\n' >> /root/.bashrc
