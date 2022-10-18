#!/bin/sh

cd "$(dirname "$(readlink -f "$0")")"

curl -so- https://raw.githubusercontent.com/dhhyi/devcontainer-creator/dist/bundle.js | node - dcc://julia . --name "7 more languages in 7 weeks: Julia" "$@"
