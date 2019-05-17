FROM ruby:2.6-alpine

MAINTAINER Andrius Semionovas <`echo 'YW5ld29ybGRAZ21haWwuY29tCg==' | base64 -d`>

ENV GOLLUM_PATH=/opt/gollum WIKIDATA_PATH=/opt/wikidata

RUN apk --no-cache add git cmake build-base icu-dev openssl-dev nodejs libidn-dev

RUN gem install wikicloth github-markdown

RUN git clone --single-branch --branch 5.x --depth 1 https://github.com/gollum/gollum.git $GOLLUM_PATH && \
    rm -rf $GOLLUM_PATH/.git

RUN cd $GOLLUM_PATH && bundle

RUN mkdir $WIKIDATA_PATH && \
    git init $WIKIDATA_PATH

ADD gollum-entrypoint.sh /opt/
ENTRYPOINT ["/opt/gollum-entrypoint.sh"]
