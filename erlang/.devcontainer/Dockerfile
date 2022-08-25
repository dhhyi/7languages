FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:16

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends erlang

RUN echo 'export PS1="$ "' >> /home/node/.bashrc
RUN echo 'erl +V' >> /home/node/.bashrc
