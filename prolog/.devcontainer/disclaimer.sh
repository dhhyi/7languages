#!/bin/sh

(
    set -x
    gprolog --version
)

echo
cat <<EOF
Use the command "gprolog" to start a REPL.

Alternatively you can use the VSCode tasks.
EOF
