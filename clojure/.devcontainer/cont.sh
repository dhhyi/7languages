#! /bin/sh

[ -z "$1" ] && echo "Usage: $0 <clojure-script>" && exit 1

onchange -ik '**/*.clj' -- clojure -M "$1"
