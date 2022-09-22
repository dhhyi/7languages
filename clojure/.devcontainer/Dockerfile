FROM mcr.microsoft.com/vscode/devcontainers/java:0-17-bullseye

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    inotify-tools

ARG CLOJURE_VERSION=1.11.1.1155
RUN cd /tmp && curl -O https://download.clojure.org/install/linux-install-${CLOJURE_VERSION}.sh && chmod +x linux-install-${CLOJURE_VERSION}.sh
RUN /tmp/linux-install-${CLOJURE_VERSION}.sh

RUN cd /usr/local/bin && curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && chmod +x lein

RUN echo > /conda-notice.txt

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont

COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

USER vscode

RUN echo 'export PS1="$ "' >> $HOME/.bashrc
