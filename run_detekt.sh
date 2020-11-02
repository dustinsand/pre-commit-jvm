#!/bin/bash

# add default config arguments if not specified
detekt_args="${@:2}"
if [[ detekt_args != *"--auto-correct "* ]] && [[ detekt_args != *"-ac "* ]]; then
  detekt_args="$detekt_args --auto-correct"
fi
if [[ detekt_args != *"--config "* ]] && [[ detekt_args != *"-c "* ]]; then
  detekt_args="$detekt_args --config /opt/detekt/detekt-config.yml"
fi
if [[ detekt_args != *"--plugins "* ]] && [[ detekt_args != *"-p "* ]]; then
  detekt_args="$detekt_args --plugins /opt/detekt/detekt-formatting.jar"
fi

echo "Detect arguments: $detekt_args"

/opt/detekt/detekt $detekt_args
