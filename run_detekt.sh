#!/bin/bash

# TODO add support for optional arguments

/opt/detekt --auto-correct true --config /opt/detekt/detekt-config.yml --excludes "**/generated/**" --jvm-target JVM_1_8 --plugins /opt/detekt/detekt-formatting.jar --version
