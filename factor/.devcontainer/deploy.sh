#!/bin/sh

set -e

factor=$(which factor)

if [ -z "$factor" ]; then
    echo "Factor not found. Please install it."
    exit 1
fi

vocab=$1

if [ -z "$vocab" ]; then
    echo "Usage: $0 <vocab>"
    exit 1
fi

cat >/tmp/factor-deploy.factor <<EOF
USE: tools.deploy

"$vocab" deploy
EOF

sudo $factor /tmp/factor-deploy.factor

bin=$(dirname $factor)/$vocab/$vocab

stat $bin >/dev/null 2>&1

cp $bin ./$vocab.bin

sudo chown $USER:$USER ./$vocab.bin

echo "Deployed $vocab to ./$vocab.bin"
