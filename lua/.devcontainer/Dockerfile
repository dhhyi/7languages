FROM mcr.microsoft.com/vscode/devcontainers/base

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential cmake timidity fluid-soundfont-gm inotify-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ARG LUAROCKS_VERSION
ARG LUA_VERSION

ADD http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz /tmp
RUN cd /tmp && tar zxf lua-${LUA_VERSION}.tar.gz && cd lua-${LUA_VERSION} && make all test && make install
ADD https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz /tmp
RUN cd /tmp && tar zxpf luarocks-${LUAROCKS_VERSION}.tar.gz && cd luarocks-${LUAROCKS_VERSION} && ./configure && make && make install
RUN git clone https://github.com/craigsapp/midifile /tmp/midifile
RUN cd /tmp/midifile && make library
RUN mkdir -p /usr/include/midifile && cp -Rfv /tmp/midifile/include/*.h /usr/include/midifile
RUN mkdir -p /usr/lib/midifile && cp -Rfv /tmp/midifile/lib/*.a /usr/lib/

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont

COPY disclaimer.sh selftest.sh /
RUN chmod +x /disclaimer.sh /selftest.sh

USER vscode

RUN echo 'export PS1="$ "' >> $HOME/.bashrc && echo '\nexport PS1="$ "' >> $HOME/.zshrc
