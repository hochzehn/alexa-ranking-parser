FROM alpine:3.3

RUN apk add --no-cache --virtual \
  bash \
  wget \
  unzip

ADD . /opt/app
WORKDIR /opt/app

ENTRYPOINT ["bin/run.sh"]
CMD [""]
