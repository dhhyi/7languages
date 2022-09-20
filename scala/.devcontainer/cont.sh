#!/bin/sh

[ -z "$1" ] && echo "Usage: $0 <script>" && exit 1
[ ! -f "$1" ] && echo "File not found: $1" && exit 1

onchange -ik '**/*.scala' -- amm "$1"
