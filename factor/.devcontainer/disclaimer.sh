#!/bin/sh

(
    set -x
    factor </dev/null ; echo
)

echo
cat <<EOF
Use the command "factor" to start a REPL.
Use the command "cont <script>" to continuously evaluate a given script.

Alternatively you can use the VSCode tasks.
EOF
