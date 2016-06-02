#!/usr/bin/env bash

# Defaults
JOBS_DEFAULT=10
NUM_DEFAULT=10
# Parameters

NUM=$1
if [ -z $NUM ]; then
  echo "Number of domains not specified with argument \$1. Using default: $NUM_DEFAULT"
  NUM=$NUM_DEFAULT
fi

if [ -z $jobs ]; then
    echo "Number of parallel jobs for curl to restMQ not specified with environment \$jobs. Using default: $JOBS_DEFAULT"
    jobs=$JOBS_DEFAULT
fi

# Constants

INPUT_FILE="tmp/alexa.csv"
INTERMEDIATE_FILE="tmp/current.csv"
DOMAIN_FILE="tmp/domains.txt"
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
