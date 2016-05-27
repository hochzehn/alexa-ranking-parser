#!/usr/bin/env bash

# Parameters

NUM=$1
if [ -z $NUM ]; then
  NUM=10
fi

# Constants

INPUT_FILE="tmp/alexa.csv"
INTERMEDIATE_FILE="tmp/current.csv"

# Run

head -n "$NUM" "$INPUT_FILE" > "$INTERMEDIATE_FILE"

while read entry; do
  values=(${entry//,/ })

  rank=${values[0]}
  domain=${values[1]}

  echo "$domain is #$rank"
done < "$INTERMEDIATE_FILE"
