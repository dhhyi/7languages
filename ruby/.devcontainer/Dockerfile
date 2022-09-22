FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-3

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    inotify-tools

RUN gem install rubocop

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont

COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

USER vscode

RUN echo 'export PS1="$ "' >> $HOME/.bashrc && echo '\nexport PS1="$ "' >> $HOME/.zshrc
