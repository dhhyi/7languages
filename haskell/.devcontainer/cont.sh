#!/bin/sh

[ -z "$1" ] && echo "Usage: $0 <script>" && exit 1
[ ! -f "$1" ] && echo "File not found: $1" && exit 1

trap 'git clean -qXf' INT TERM EXIT

onchange -ik '**/*.hs' -- sh -c "ghc -o executable $1 && ./executable"
