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

export FOLDER=$1

if [ ! -d node_modules ]
then
    echo "Installing dependencies..."
    npm i --no-save gomplate pajv &> /dev/null
fi

pajv=$(find node_modules -name pajv -type l -print | head -n 1)
[ -z "$pajv" ] && echo "Error: could not install pajv" && exit 1

gomplate=$(find node_modules -name gomplate -type f -print | head -n 1)
[ -z "$gomplate" ] && echo "Error: could not install gomplate" && exit 1


$pajv validate -s .templates/language_schema.json -d $FOLDER/language.yaml --errors=text --verbose


echo "Generating $FOLDER"

find .templates -type f -name "*.gomplate" | while read -r template
do
    file=$(echo "$template" | sed -e 's/^.templates//g' -e 's/\.gomplate$//g')
    if [ -f "$FOLDER$file" ]
    then
        rm "$FOLDER$file"
    fi
done

export GOMPLATE_SUPPRESS_EMPTY=true

$gomplate --input-dir .templates \
          --include "**/*.gomplate" \
          --output-map=$FOLDER'/{{ .in | strings.TrimSuffix ".gomplate" }}' \
          -d language=$FOLDER/language.yaml \
          -d vscodesettings=.templates/.devcontainer/vscode.default.settings.json

mv -f $FOLDER/workflow.yml .github/workflows/$FOLDER.yml

echo "Done"
