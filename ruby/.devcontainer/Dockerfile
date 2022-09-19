FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-3

RUN su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install --lts 2>&1"

RUN gem install rubocop

RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g onchange" 2>&1

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont
COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

USER vscode

RUN echo 'export PS1="$ "' >> $HOME/.bashrc
