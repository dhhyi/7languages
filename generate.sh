#!/bin/bash

MYSHELL=`ps -hp $$ | awk '{print $5}'`
if [ "$(basename $MYSHELL)" != "bash" ]
then
    echo "script it written for bash only, detected $MYSHELL"
    exit 1
fi

set -e
set -o pipefail

[ -z "$1" ] && echo "Usage: $0 <folder>" && exit 1
[ ! -d "$1" ] && echo "Error: $1 is not a folder" && exit 1
[ ! -f "$1/language.yaml" ] && echo "Error: $1/language.yaml does not exist" && exit 1

GOMPLATE_IMAGE=hairyhenderson/gomplate:stable

docker inspect "$GOMPLATE_IMAGE" >/dev/null || docker pull "$GOMPLATE_IMAGE"

cat .templates/generate.sh.gomplate | docker run --rm -i -e FOLDER=$1 -v $PWD/$1/language.yaml:/language.yaml:ro $GOMPLATE_IMAGE -d language=/language.yaml -f - > $1/generate.sh~

bash $1/generate.sh~

echo "Done"
