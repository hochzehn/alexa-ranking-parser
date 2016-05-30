#!/usr/bin/env bash

# Parameters

NUM=$1
if [ -z $NUM ]; then
  NUM=10
fi

# Constants

INPUT_FILE="tmp/alexa.csv"
INTERMEDIATE_FILE="tmp/current.csv"
DOMAIN_FILE="tmp/domains.txt"
# Run

head -n "$NUM" "$INPUT_FILE" > "$INTERMEDIATE_FILE"

rm -f $DOMAIN_FILE 2> dev/null

while read entry; do
  values=(${entry//,/ })

  rank=${values[0]}
  domain=${values[1]}

  echo $domain >> $DOMAIN_FILE

done < "$INTERMEDIATE_FILE"

echo "DOMAIN FILE: "
cat $DOMAIN_FILE

cat $DOMAIN_FILE | parallel --jobs 100 curl -s -X POST -d "value={}" "http://$restmq:8888/q/domains"
