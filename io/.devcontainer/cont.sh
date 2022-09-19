#! /bin/sh

[ -z "$1" ] && echo "Usage: $0 <script>" && exit 1

onchange -ik '**/*.io' -- io "$1"
