#!/bin/sh

set -e

[ -z "$1" ] && echo "Usage: $0 <lua-script>" && exit 1

./play "$1"

file="$(basename "$1" .lua)"

timidity "$file.mid" -Ow -o "$file.wav"
