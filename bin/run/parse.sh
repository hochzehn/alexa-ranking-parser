#!/usr/bin/env bash

# Parameters

NUM=$1

# Constants

INPUT_FILE="tmp/alexa.csv"

# Run

if [ -z $NUM ]; then
  cat "$INPUT_FILE"
else
  head -n "$NUM" "$INPUT_FILE"
fi
