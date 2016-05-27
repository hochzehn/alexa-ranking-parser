FROM phusion/baseimage:0.9.15

RUN apt-get update && apt-get install wget unzip

ADD bin/ bin/
ADD tmp/ tmp/

ENTRYPOINT ["bin/run.sh"]
