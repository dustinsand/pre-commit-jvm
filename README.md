[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/dustinsand/pre-commit-jvm)

pre-commit-jvm
===============

A collection of git hooks for the JVM to be used with the [pre-commit framework](http://pre-commit.com).

## Requirements

pre-commit-jvm requires the following to run:

  * [pre-commit(2.8+)](http://pre-commit.com)
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
    - id: pmd
```

## Available Hooks

| Hook name       | Description                                                                                        |
| --------------- | -------------------------------------------------------------------------------------------------- |
| `detekt`           | Runs [Detekt](https://detekt.github.io/detekt/) static code analyzer on Kotlin source files.                                        |
| `pmd`           | Runs [PMD](https://pmd.github.io/) static code analyzer on Java source files.                                        |

### Notes about the `detekt` hook

To specify a custom detekt configuration, simply pass the argument to the hook:

```yaml
    - id: detekt
      args: [--config, detekt-config.yml]
```

Other [CLI](https://arturbosch.github.io/detekt/cli.html) arguments are also supported.

### Notes about the `pmd` hook

Required arguments for the hook

| Argument | Description |
| -------- | -------------------------------------------- |
| dir | Root directory for sources.                       |
| rulesets | Comma separated list of ruleset names to use.| 

```yaml
    - id: pmd
      args: [ -dir, src/main/java, -rulesets, pmd-ruleset.xml ]
```

Other [CLI](https://pmd.github.io/latest/pmd_userdocs_installation.html) arguments are also supported.
