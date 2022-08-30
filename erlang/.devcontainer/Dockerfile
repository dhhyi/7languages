FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:16

RUN npm install -g onchange 2>&1

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends erlang

COPY erlang /usr/local/bin/erlang
RUN chmod +x /usr/local/bin/erlang

USER node

# https://elixirforum.com/t/erlang-blog-post-formatting-your-erlang-code-in-visual-studio-code/35284
RUN git clone https://github.com/erlang/rebar3.git /tmp/rebar3 && cd /tmp/rebar3 && ./bootstrap && ./rebar3 local install
COPY --chown=node rebar.config /home/node/.config/rebar3/rebar.config

ENV PATH=$PATH:/home/node/.cache/rebar3/bin

RUN echo 'export PS1="$ "' >> /home/node/.bashrc
RUN echo 'erl +V' >> /home/node/.bashrc
