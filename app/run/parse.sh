#!/usr/bin/env bash

# Defaults
JOBS_DEFAULT=10
NUM_DEFAULT=10

# Parameters
NUM=$1
jobs=$JOBS_DEFAULT


# Constants
INPUT_FILE="tmp/alexa.csv"
INTERMEDIATE_FILE=$(mktemp)
DOMAIN_FILE=$(mktemp)

# Run
head -n "$NUM" "$INPUT_FILE" > "$INTERMEDIATE_FILE"

rm -f $DOMAIN_FILE 2> /dev/null

while read entry; do
  values=(${entry//,/ })

  rank=${values[0]}
  domain=${values[1]}

  echo $domain >> $DOMAIN_FILE

done < "$INTERMEDIATE_FILE"

cat $DOMAIN_FILE
