#!/bin/bash

# find the index of the first parameter with a Kotlin file path
idx=1
for (( i=1; i <= "$#"; i++ )); do
    if [[ ${!i} == *.kt ]]; then
        idx=${i}
        break
    fi
done

# add minimum default config arguments if not specified
detekt_args="${*:1:idx-1}"
if [[ $detekt_args != *"--config"* && $detekt_args != *"-c "* ]]
  detekt_args="$detekt_args --config /opt/detekt/detekt-config.yml"
fi

echo "Passed detekt arguments: $detekt_args"

/opt/detekt/detekt $detekt_args
