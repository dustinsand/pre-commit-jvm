#!/bin/bash

# add default ruleset if not specified
pc_args="${*:1:idx-1}"
if [[ ! $pc_args == *"-R "* ]]; then
  pc_args="$pc_args -R /opt/detekt/ruleset.xml"
fi

/opt/detekt --auto-correct true --config /opt/detekt/detekt-config.yml --excludes "**/generated/**" --jvm-target JVM_1_8 --plugins /opt/detekt/detekt-formatting.jar --version
