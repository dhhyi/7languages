#!/bin/sh

(
    set -x
    lua -v
    luarocks --version
)

echo
cat <<EOF
Use the command "lua" to start a REPL.
Use the command "cont <script>" to continuously evaluate a given script.

Alternatively you can use the VSCode tasks.
EOF
