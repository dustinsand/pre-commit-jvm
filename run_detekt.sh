#!/bin/bash

# TODO add support for optional arguments

/opt/detekt/detekt \
  --auto-correct \
  --config /opt/detekt/detekt-config.yml \
  --plugins /opt/detekt/detekt-formatting.jar
