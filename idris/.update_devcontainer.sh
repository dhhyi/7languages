#!/bin/sh -e

cd "$(dirname "$(readlink -f "$0")")"

curl -so- https://raw.githubusercontent.com/dhhyi/devcontainer-creator/dist/bundle.js | node - dcc://idris2 . --name "7 more languages in 7 weeks: Idris" "$@"
