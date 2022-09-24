FROM mcr.microsoft.com/vscode/devcontainers/base

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    inotify-tools
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential libpcre3-dev libevent-dev cmake

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont

COPY disclaimer.sh selftest.sh /
RUN chmod +x /disclaimer.sh /selftest.sh

USER vscode
ENV HOME=/home/vscode

RUN git clone --recursive https://github.com/IoLanguage/io.git /tmp/io
RUN cd /tmp/io && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=release .. && make && sudo make install && io setup.io
ENV EERIEDIR=${HOME}/.eerie PATH=${PATH}:${HOME}/.eerie/base/bin:${HOME}/.eerie/activeEnv/bin
WORKDIR ${HOME}
RUN eerie install https://github.com/IoLanguage/Regex.git
RUN eerie install https://github.com/IoLanguage/Random.git

RUN echo 'export PS1="$ "' >> $HOME/.bashrc && echo '\nexport PS1="$ "' >> $HOME/.zshrc
