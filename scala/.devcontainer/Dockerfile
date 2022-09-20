FROM mcr.microsoft.com/vscode/devcontainers/java:0-17-bullseye

RUN su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install --lts 2>&1"
RUN npm install -g onchange 2>&1

RUN sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/com-lihaoyi/Ammonite/releases/download/2.5.4/2.13-2.5.4) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm'

RUN curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > /bin/cs && chmod +x /bin/cs

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont
COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

USER vscode

RUN cs install scalafmt

ENV PATH="/home/vscode/.local/share/coursier/bin:${PATH}"

RUN echo 'export PS1="$ "' >> $HOME/.bashrc
