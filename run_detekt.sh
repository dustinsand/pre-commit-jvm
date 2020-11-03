#!/bin/bash

DETEKT_VERSION=1.14.2

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
if [[ $detekt_args != *"--config"* && $detekt_args != *"-c "* ]]; then
  detekt_args="$detekt_args --config detekt-config.yml"
fi

echo "Passed detekt arguments: $detekt_args"

cs launch io.gitlab.arturbosch.detekt:detekt-cli:$DETEKT_VERSION -M io.gitlab.arturbosch.detekt.cli.Main -r https://kotlin.bintray.com/kotlinx -- $detekt_args
