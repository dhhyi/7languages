#!/bin/sh

(
    set -x
    ghcup --version
    ghc --version
)

echo
cat <<EOF
use the command "ghci" to start a REPL
use the command "cont <script>" to continuously evaluate a given script
EOF