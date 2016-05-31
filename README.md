# alexa-ranking-parser

Access list of Alexa top sites in CLI, via Docker.

Simple wrapper around the free list of the top one million website ranked by [Alexa](http://www.alexa.com), as described [here](https://support.alexa.com/hc/en-us/articles/200449834-Does-Alexa-have-a-list-of-its-top-ranked-websites-) and available for download [here](http://s3.amazonaws.com/alexa-static/top-1m.csv.zip).

## Usage

    docker-compose up

Returns the first 10 domains on the list, e.g.

    1,google.com
    2,youtube.com
    3,facebook.com
    4,baidu.com
    5,yahoo.com
    6,wikipedia.org
    7,amazon.com
    8,twitter.com
    9,qq.com
    10,live.com

## Further processing

You can process the output in Bash with a loop like the following:

    #!/usr/bin/env bash
    FILE="alexa.csv"

    docker run --rm hochzehn/alexa-ranking-parser 10 > "$FILE"

    while read row; do
      values=(${row//,/ })

      rank=${values[0]}
      domain=${values[1]}

      echo "$domain is ranked #$rank"
    done < "$FILE"
