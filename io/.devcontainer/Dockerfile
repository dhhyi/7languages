FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:16

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends cmake

RUN npm install -g onchange 2>&1

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont
COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

RUN echo 'export PS1="$ "' >> $HOME/.bashrc

RUN git clone --recursive https://github.com/IoLanguage/io.git /tmp/io
RUN cd /tmp/io \
&& mkdir build \
&& cd build \
&& mkdir -p /home/node/bin \
&& cmake -DCMAKE_BUILD_TYPE=release .. \
&& make \
&& make install \
&& export PATH=$PATH:_build/binaries/; . ./install_unix.sh

ENV EERIEDIR=/root/.eerie PATH=$PATH:/root/.eerie/base/bin:/root/.eerie/activeEnv/bin
RUN eerie install https://github.com/IoLanguage/Range.git
RUN eerie install https://github.com/IoLanguage/Regex.git
RUN eerie install https://github.com/IoLanguage/Random.git
RUN eerie install https://github.com/IoLanguage/HttpClient.git
