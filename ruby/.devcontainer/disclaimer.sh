#!/bin/sh

(
    set -x
    rubocop --version
    ruby --version
)

echo
cat <<EOF
Use the command "irb" to start a REPL.
Use the command "cont <script>" to continuously evaluate a given script.

Alternatively you can use the VSCode tasks.
EOF
