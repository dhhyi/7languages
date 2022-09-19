#!/bin/sh

(
    set -x
    io --version
)

echo
cat <<EOF
Use the command "io" to start a REPL.
Use the command "cont <script>" to continuously evaluate a given script.

Alternatively you can use the VSCode tasks.
EOF
