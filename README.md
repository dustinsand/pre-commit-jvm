[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/dustinsand/pre-commit-jvm)

pre-commit-kotlin
===============

A collection of git hooks for kotlin to be used with the [pre-commit framework](http://pre-commit.com).

## Requirements

  * [pre-commit](http://pre-commit.com)
  * [Coursier](https://get-coursier.io/)
  
### pre-commit
    
    * pip install pre-commit

### Coursier
    
    * curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs
    * chmod +x cs
    * ./cs setup
    * add export PATH="$PATH:$HOME/.local/share/coursier/bin" to zshrc or bashrc

    
## Install

1. create `.pre-commit-config.yaml` in your git project
2. pre-commit install

example `.pre-commit-config.yaml`:

```yaml
repos:
  - repo: https://github.com/alexanderpichler-cpi/pre-commit-kotlin
    rev: v1.0.1
    hooks:
      - id: detekt
        args: [--build-upon-default-config, --config, lint/config/detekt.yml]
      - id: ktlint
        entry: bash -c ' export JDK_JAVA_OPTIONS="--add-opens=java.base/java.lang=ALL-UNNAMED" && ktlint --format  --editorconfig=lint/config/.editorconfig'
```

## Available Hooks

| Hook name       | Description                                                                                        |
| --------------- | -------------------------------------------------------------------------------------------------- |
| `detekt`           | Runs [Detekt](https://detekt.github.io/detekt/) static code analyzer on Kotlin source files. |
| `ktlint`           | Runs [Ktlint](https://ktlint.github.io/) to lint and reformat Kotlin source code. |

### Notes about the `detekt` hook

To specify a custom detekt configuration, simply pass the argument to the hook:

```yaml
    - id: detekt
      args: [--config, detekt-config.yml]
```

Other [CLI](https://arturbosch.github.io/detekt/cli.html) arguments are also supported.


### Notes about the `ktlint` hook

Minimum required arguments for the hook:

```yaml
    - id: ktlint
      args: [--format]
```

Other [CLI](https://ktlint.github.io/#getting-started) arguments are also supported. 

You can also use Coursier to get the list of options.
```
cs launch com.pinterest:ktlint:v.x.x.x -M com.pinterest.ktlint.Main -- --help
```

