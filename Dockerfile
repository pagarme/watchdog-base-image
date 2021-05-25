FROM python:3.8-alpine

LABEL maintainer="pagarme"

ENV CREDSTASH_VERSION=v0.3.3
ENV DOCKERIZE_VERSION=v0.6.1

# Install gcredstash and dockerize
RUN set -ex \
    && apk update && apk add wget ca-certificates \
    && wget -O - https://github.com/winebarrel/gcredstash/releases/download/$CREDSTASH_VERSION/gcredstash-$CREDSTASH_VERSION-linux-amd64.gz | gunzip -c  > /usr/local/bin/gcredstash \
    && wget -O - https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar -C /usr/local/bin -xzv \
    && chmod -v 755 /usr/local/bin/gcredstash /usr/local/bin/dockerize

COPY requirements.txt install_dependencies.sh /

RUN sh install_dependencies.sh && \
    rm requirements.txt install_dependencies.sh
