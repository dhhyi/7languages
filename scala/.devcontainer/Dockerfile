FROM mcr.microsoft.com/vscode/devcontainers/java:0-17-bullseye

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    inotify-tools

RUN sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/com-lihaoyi/Ammonite/releases/download/2.5.4/2.13-2.5.4) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm'
# RUN curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > /bin/cs && chmod +x /bin/cs

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont

COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

USER vscode
ENV HOME=/home/vscode

# RUN cs setup -y

RUN echo 'export PS1="$ "' >> $HOME/.bashrc
