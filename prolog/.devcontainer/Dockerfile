FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:16

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # && apt-get -y install --no-install-recommends <your-package-list-here>

RUN npm install -g onchange 2>&1

RUN echo 'export PS1="$ "' >> /home/node/.bashrc

ADD http://www.gprolog.org/gprolog-1.5.0.tar.gz /tmp
RUN cd /tmp && tar -xvvf gprolog-1.5.0.tar.gz
RUN cd /tmp/gprolog-1.5.0/src && ls -l && ./configure && make && make install && make check