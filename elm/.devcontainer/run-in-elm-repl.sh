#!/bin/sh

script=$1
[ -z "$script" ] && echo "Usage: $0 <script>" && exit 1

(
    sleep 2
    cat $script | egrep -v "^#" | while read -r line
    do
        if echo "$line" | egrep -q '\\$'
        then
            echo -n "$line" | sed -e 's/.$//' >>/tmp/buffer
        else
            if [ -s /tmp/buffer ]
            then
                echo -n "$line" >>/tmp/buffer
                cat /tmp/buffer >&2
                cat /tmp/buffer
                rm /tmp/buffer
            else
                echo "$line" >&2
                echo "$line"
            fi
            sleep 1
        fi
    done
    echo
    sleep 1
    echo
    sleep 2
    echo "\nREPL is now interactive" >&2
    echo
    cat /dev/stdin
) | elm repl
