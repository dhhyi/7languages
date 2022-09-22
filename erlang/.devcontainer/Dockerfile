FROM mcr.microsoft.com/vscode/devcontainers/base

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    inotify-tools erlang

COPY cont.sh /usr/local/bin/cont
RUN chmod +x /usr/local/bin/cont

COPY disclaimer.sh /
RUN chmod +x /disclaimer.sh

USER vscode

# https://elixirforum.com/t/erlang-blog-post-formatting-your-erlang-code-in-visual-studio-code/35284
RUN git clone https://github.com/erlang/rebar3.git /tmp/rebar3 && cd /tmp/rebar3 && ./bootstrap && ./rebar3 local install
COPY --chown=vscode rebar.config /home/vscode/.config/rebar3/rebar.config
ENV PATH=$PATH:/home/vscode/.cache/rebar3/bin

RUN echo 'export PS1="$ "' >> $HOME/.bashrc
