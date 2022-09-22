FROM mcr.microsoft.com/vscode/devcontainers/base

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    inotify-tools
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential

ARG LUA_VERSION=5.4.4
RUN cd /tmp && curl -R -O http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz && tar zxf lua-${LUA_VERSION}.tar.gz && cd lua-${LUA_VERSION} && make all test && make install

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont

COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

USER vscode

RUN echo 'export PS1="$ "' >> $HOME/.bashrc && echo '\nexport PS1="$ "' >> $HOME/.zshrc
