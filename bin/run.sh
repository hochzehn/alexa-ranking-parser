#!/bin/sh

NAME="hochzehn/$(basename ${PWD})"

docker build --tag $NAME . > /dev/null

if [ $# -ne 1 ]
then
    echo "Usage: bin/run.sh element_limit"
else
    docker run \
      --rm \
      $NAME \
      $*
fi
