#!/bin/bash

MYSHELL=`ps -hp $$ | awk '{print $5}'`
if [ "$(basename $MYSHELL)" != "bash" ]
then
    echo "script is written for bash only, detected $MYSHELL"
    exit 1
fi

set -e
set -o pipefail

[ -z "$1" ] && echo "Usage: $0 <folder>" && exit 1
[ ! -d "$1" ] && echo "Error: $1 is not a folder" && exit 1
[ ! -f "$1/language.yaml" ] && echo "Error: $1/language.yaml does not exist" && exit 1

export FOLDER=$1

echo "Generating $FOLDER"

git clean -Xfd $FOLDER/.devcontainer $FOLDER/.vscode

curl -so- https://raw.githubusercontent.com/dhhyi/devcontainer-creator/dist/bundle.js | node - $FOLDER/language.yaml $FOLDER

cat >.github/workflows/$FOLDER.yml <<EOF
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

      - name: Generate Devcontainer
        run: bash generate.sh $FOLDER

      - name: Build Devcontainer
        run: |
          npm install -g @devcontainers/cli
          devcontainer build --workspace-folder $FOLDER --image-name $FOLDER-devcontainer

      - name: Run Selftest
        run: docker run --rm $FOLDER-devcontainer sh /selftest.sh
EOF

echo "Done"
