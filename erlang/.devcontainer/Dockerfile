FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:16

RUN npm install -g onchange 2>&1

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends erlang

COPY erlang /usr/local/bin/erlang
RUN chmod +x /usr/local/bin/erlang

RUN echo 'export PS1="$ "' >> /home/node/.bashrc
RUN echo 'erl +V' >> /home/node/.bashrc
