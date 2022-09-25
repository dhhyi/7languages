ARG JAVA_VERSION

FROM mcr.microsoft.com/vscode/devcontainers/java:0-${JAVA_VERSION}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    inotify-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG AMMONITE_VERSION

ADD https://github.com/com-lihaoyi/Ammonite/releases/download/${AMMONITE_VERSION} /usr/local/bin/amm
RUN sed -i '1 i\#!/usr/bin/env sh' /usr/local/bin/amm && chmod +rx /usr/local/bin/amm

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont

COPY disclaimer.sh selftest.sh /
RUN chmod +x /disclaimer.sh /selftest.sh

USER vscode

RUN echo 'export PS1="$ "' >> $HOME/.bashrc && echo '\nexport PS1="$ "' >> $HOME/.zshrc
