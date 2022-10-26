#!/bin/bash

MYSHELL=$(ps -hp $$ | awk '{print $5}')
if [ "$(basename "$MYSHELL")" != "bash" ]
then
    echo "script is written for bash only, detected $MYSHELL"
    exit 1
fi

set -e
set -o pipefail

[ -z "$1" ] && echo "Usage: $0 <folder>" && exit 1
[ ! -d "$1" ] && echo "Error: $1 is not a folder" && exit 1
[ ! -f "$1/.update_devcontainer.sh" ] && echo "Error: $1/.update_devcontainer.sh does not exist" && exit 1

export FOLDER=$1
shift

sh "$FOLDER/.update_devcontainer.sh" "$@"

cat >".github/workflows/$FOLDER.yml" <<EOF
name: $FOLDER

on:
  push:
    paths:
      - $FOLDER/language.yaml
      - .github/workflows/$FOLDER.yml

jobs:
  BuildDevcontainer:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Test Devcontainer
        run: bash generate.sh $FOLDER --test
EOF
