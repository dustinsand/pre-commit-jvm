[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/dustinsand/pre-commit-jvm)

pre-commit-jvm
===============

A collection of git hooks for the JVM to be used with the [pre-commit framework](http://pre-commit.com). So far the collection only includes one hook for Kotlin.

## Requirements

pre-commit-jvm requires the following to run:

  * [pre-commit](http://pre-commit.com)
  * [Coursier](https://get-coursier.io/)

## Install

1. create `.pre-commit-config.yaml` in your git project
2. pre-commit install

example `.pre-commit-config.yaml`:

```yaml
- repo: https://github.com/dustinsand/pre-commit-jvm
  rev: vX.X.X
  hooks:
    - id: detekt
```

## Available Hooks

| Hook name       | Description                                                                                        |
| --------------- | -------------------------------------------------------------------------------------------------- |
| `detekt`           | Runs [Detekt](https://detekt.github.io/detekt/) static code analyzer.                                        |

### Notes about the `detekt` hook

The default ruleset used is [detekt-config.yml](https://raw.githubusercontent.com/dustinsand/pre-commit-jvm/main/detekt-config.yml).

To specify a custom detekt configuration, simply pass the argument to the hook:

```yaml
    - id: detekt
      args: [--config, detekt-config.yml]
```

Other [CLI](https://arturbosch.github.io/detekt/cli.html) arguments are also supported.
