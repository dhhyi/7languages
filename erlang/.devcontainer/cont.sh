#!/bin/sh

[ -z "$1" ] && echo "Usage: $0 <erlang-file>" && exit 1

dir=`dirname $1`
file=`basename $1 .erl`

echo "using $file in $dir"

trap "git clean -Xf" EXIT INT TERM

onchange --await-write-finish 500 -ik "$dir/**" -- sh -c "echo 'compiling...' && erlc $dir/$file.erl && echo '--------------' && erl -noshell -s $file start -s init stop"