#!/bin/sh

# get_pip_dependencies.sh :
# listing Python packages dependencies with pip

# Source: https://stackoverflow.com/a/38531949/6709630

PACKAGE=$1
pip download $PACKAGE -d /tmp --no-binary :all: \
| grep Collecting \
| cut -d' ' -f2 \
| grep -Ev "$PACKAGE(~|=|\!|>|<|$)"
