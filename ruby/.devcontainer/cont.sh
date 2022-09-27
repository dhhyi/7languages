#!/bin/sh

[ -z "$*" ] && echo "Usage: $0 <watch> <command>..." && exit 1

if [ "$#" -eq "1" ]
then
    watch=$1
    command="ruby $1"
else
    watch="$1"
    shift
    command="$*"
fi

echo "continuously running '$command' watching '$watch'"

$command
while inotifywait -qq -e close_write $watch; do $command; done
