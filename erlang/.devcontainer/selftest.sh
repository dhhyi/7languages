#!/bin/sh

set -e
set -x
erl +V
cat > /tmp/helloworld.erl <<EOF
-export([main/1]).

main(_) -> io:format("Hello World!\n").
EOF
escript /tmp/helloworld.erl
