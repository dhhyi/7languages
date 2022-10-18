#!/bin/sh

cd "$(dirname "$(readlink -f "$0")")"

curl -so- https://raw.githubusercontent.com/dhhyi/devcontainer-creator/dist/bundle.js | node - dcc://clojure . --name "7 languages in 7 weeks: Clojure" "$@"
