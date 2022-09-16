FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:16

USER node

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ENV PATH="/home/node/.ghcup/bin:${PATH}"
RUN ghcup install hls
RUN ghcup install stack

USER root
RUN npm install -g onchange 2>&1
COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont
COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

USER node

RUN echo 'export PS1="$ "' >> /home/node/.bashrc
