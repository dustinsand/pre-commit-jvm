#!/bin/bash

# find the index of the first parameter with a Kotlin file path
idx=1
for (( i=1; i <= "$#"; i++ )); do
    if [[ ${!i} == *.kt ]]; then
        idx=${i}
        break
    fi
done

# add default config arguments if not specified
detekt_args="${*:1:idx-1}"
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
