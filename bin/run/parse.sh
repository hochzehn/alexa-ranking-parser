#!/usr/bin/env bash

# Defaults
JOBS_DEFAULT=50
NUM_DEFAULT=10
RESTMQ_IP_DEFAULT=127.0.0.1
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

if [ -z $restmq_ip ]; then
    echo "IP of restMQ not specified with environment \$restmq_ip. Using default: $RESTMQ_IP_DEFAULT"
    restmq_ip=$RESTMQ_IP_DEFAULT
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
