#! /bin/sh

file="$1"

[ -z "$file" ] && echo "Usage: $0 <file>" && exit 1
[ ! -f "$file" ] && echo "File not found: $file" && exit 1

run () {
    escript "$file"
}

run
while inotifywait -qq -e close_write "$file"; do run; done
