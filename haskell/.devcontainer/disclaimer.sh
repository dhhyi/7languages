#!/bin/sh

(
    set -x
    ghcup --version
    ghc --version
)

echo
cat <<EOF
Use the command "ghci" to start a REPL.
Use the command "cont <script>" to continuously evaluate a given script.

Alternatively you can use the VSCode tasks.
EOF
