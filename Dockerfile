FROM alpine:latest

ENV SMTP_PORT=\1025
ENV HTTP_PORT=\1080

RUN apk update

RUN apk add --no-cache \
    ca-certificates \
    openssl \
    ruby \
    ruby-bigdecimal \
    ruby-etc \
    ruby-json \
    libstdc++ \
    sqlite-libs

ARG MAILCATCHER_VERSION=0.7.1

RUN apk add --no-cache --virtual .build-deps \
    ruby-dev \
    make g++ \
    sqlite-dev \
    && gem install -v $MAILCATCHER_VERSION mailcatcher --no-ri --no-rdoc \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

EXPOSE $SMTP_PORT $HTTP_PORT

CMD mailcatcher --foreground --ip=0.0.0.0 --smtp-port=$SMTP_PORT http-port=$HTTP_PORT
