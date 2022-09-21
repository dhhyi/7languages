FROM mcr.microsoft.com/vscode/devcontainers/base

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    inotify-tools build-essential libpcre3-dev libevent-dev cmake

COPY cont.sh /usr/local/bin/cont
COPY disclaimer.sh /
RUN chmod +x /usr/local/bin/cont /disclaimer.sh

USER vscode

RUN echo 'export PS1="$ "' >> $HOME/.bashrc

RUN git clone --recursive https://github.com/IoLanguage/io.git /tmp/io
RUN cd /tmp/io \
&& mkdir build \
&& cd build \
&& cmake -DCMAKE_BUILD_TYPE=release .. \
&& make \
&& sudo make install \
&& io setup.io

ENV EERIEDIR=/home/vscode/.eerie PATH=$PATH:/home/vscode/.eerie/base/bin:/home/vscode/.eerie/activeEnv/bin
WORKDIR /home/vscode
RUN eerie install https://github.com/IoLanguage/Regex.git
RUN eerie install https://github.com/IoLanguage/Random.git
