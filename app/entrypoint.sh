#!/usr/bin/env bash

./run/download.sh &> /dev/null
./run/parse.sh $1

