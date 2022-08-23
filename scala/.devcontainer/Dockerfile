ARG VARIANT="17-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/java:0-17-bullseye

RUN su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install --lts 2>&1"

RUN curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > /bin/cs && chmod +x /bin/cs
USER vscode
RUN cs setup -y

RUN npm install -g onchange 2>&1

RUN echo 'export PS1="$ "' >> /home/vscode/.bashrc
RUN echo 'scala --version' >> /home/vscode/.bashrc
