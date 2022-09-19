FROM mcr.microsoft.com/vscode/devcontainers/java:0-17-bullseye

RUN su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install --lts 2>&1"
RUN npm install -g onchange 2>&1

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont
COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

RUN cd /tmp && curl -O https://download.clojure.org/install/linux-install-1.11.1.1155.sh && chmod +x linux-install-1.11.1.1155.sh
RUN /tmp/linux-install-1.11.1.1155.sh

RUN cd /usr/local/bin && curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && chmod +x lein

RUN echo > /conda-notice.txt

USER vscode

RUN echo 'export PS1="$ "' >> $HOME/.bashrc
