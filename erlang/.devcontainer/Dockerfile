FROM mcr.microsoft.com/vscode/devcontainers/base

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    erlang inotify-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont

COPY disclaimer.sh selftest.sh /
RUN chmod +x /disclaimer.sh /selftest.sh

USER vscode
ENV HOME=/home/vscode

RUN git clone https://github.com/erlang/rebar3.git /tmp/rebar3 && cd /tmp/rebar3 && ./bootstrap && ./rebar3 local install
COPY --chown=vscode rebar.config ${HOME}/.config/rebar3/rebar.config
ENV PATH=${PATH}:${HOME}/.cache/rebar3/bin

RUN echo 'export PS1="$ "' >> $HOME/.bashrc && echo '\nexport PS1="$ "' >> $HOME/.zshrc
