FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:16

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends cmake

RUN npm install -g onchange 2>&1

RUN echo 'export PS1="$ "' >> /home/node/.bashrc

ADD http://iobin.suspended-chord.info/linux/iobin-linux-x64-deb-current.zip /tmp
RUN unzip /tmp/iobin*.zip -d /tmp \
    && dpkg -i /tmp/IoLanguage*.deb

# RUN git clone --recursive https://github.com/IoLanguage/io.git /tmp/io
# RUN cd /tmp/io \
# && mkdir build \
# && cd build \
# && cmake -DCMAKE_BUILD_TYPE=release .. \
# && make \
# && make install \
# && export PATH=$PATH:_build/binaries/ && . ./install_unix.sh
# RUN cd /tmp/io/eerie; . ./install_unix.sh
# # RUN find / -name eerie && find /tmp/io/eerie && false
# RUN /tmp/io/eerie/bin/eerie install https://github.com/IoLanguage/Range.git
# RUN /tmp/io/eerie/bin/eerie install https://github.com/IoLanguage/Regex.git

