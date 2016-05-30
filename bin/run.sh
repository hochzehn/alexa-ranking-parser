#!/usr/bin/env bash

bin/run/download.sh &> /dev/null
bin/run/parse.sh $1

