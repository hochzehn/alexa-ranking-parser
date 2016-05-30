FROM alpine:3.3

RUN apk add --no-cache \
  bash \
  wget \
  unzip \
  parallel \
  curl

ADD . /opt/app
WORKDIR /opt/app

ENTRYPOINT ["bin/run.sh"]
CMD [""]
