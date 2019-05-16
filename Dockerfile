FROM ruby:2.6-alpine

MAINTAINER Andrius Semionovas <`echo 'YW5ld29ybGRAZ21haWwuY29tCg==' | base64 -d`>

RUN apk --no-cache add git cmake build-base icu-dev openssl-dev nodejs libidn-dev

RUN gem install wikicloth github-markdown

RUN git clone --single-branch --branch 5.x --depth 1 https://github.com/gollum/gollum.git /root/gollum && \
    rm -rf /root/.git

RUN cd /root/gollum && \
    bundle

RUN mkdir /root/wikidata && \
    git init /root/wikidata

ADD gollum-entrypoint.sh /root/
ENTRYPOINT ["/root/gollum-entrypoint.sh"]
