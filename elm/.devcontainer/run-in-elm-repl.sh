#!/bin/sh

script=$1
[ -z "$script" ] && echo "Usage: $0 <script>" && exit 1

(
    sleep 2
    cat $script | egrep -v "^#" | while read -r line
    do
        echo "$line" >&2
        echo "$line"
        sleep 1
    done
    echo
    sleep 1
    echo
    sleep 2
    echo "\nREPL is now interactive" >&2
    echo
    cat /dev/stdin
) | elm repl
