#!/bin/sh

set -e

git clean -Xfd

cmake .
make
