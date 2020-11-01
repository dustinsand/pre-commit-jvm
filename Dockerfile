FROM openjdk:13-alpine

ARG DETEKT_DIR=/opt/detekt
ARG DETEKT_VERSION=1.14.2

RUN apk add --update --no-cache bash curl wget
RUN mkdir -p $DETEKT_DIR

RUN cd $DETEKT_DIR \
      && curl -sSLO https://github.com/detekt/detekt/releases/download/v$DETEKT_VERSION/detekt && chmod a+x detekt \
      && wget -O detekt-formatting.jar https://repo1.maven.org/maven2/io/gitlab/arturbosch/detekt/detekt-formatting/$DETEKT_VERSION/detekt-formatting-$DETEKT_VERSION.jar

COPY run_detekt.sh $DETEKT_DIR
COPY detekt-config.yml $DETEKT_DIR
