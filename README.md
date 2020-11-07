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
    - id: google-java-formatter
    - id: ktlint
    - id: pmd
```

## Available Hooks

| Hook name       | Description                                                                                        |
| --------------- | -------------------------------------------------------------------------------------------------- |
| `detekt`           | Runs [Detekt](https://detekt.github.io/detekt/) static code analyzer on Kotlin source files. |
| `google-java-formatter`           | Runs [Google Java Formatter](https://github.com/google/google-java-format) to reformat Java source code to comply with [Google Java Style](https://google.github.io/styleguide/javaguide.html). |
| `ktlint`           | Runs [Ktlint](https://ktlint.github.io/) to lint and reformat Kotlin source code. |
| `pmd`           | Runs [PMD](https://pmd.github.io/) static code analyzer on Java source files. |

### Notes about the `detekt` hook

To specify a custom detekt configuration, simply pass the argument to the hook:

```yaml
    - id: detekt
      args: [--config, detekt-config.yml]
```

Other [CLI](https://arturbosch.github.io/detekt/cli.html) arguments are also supported.

### Notes about the `google-java-formatter` hook

Minimum required arguments for the hook:

```yaml
    - id: google-java-formatter
      args: [--replace, --set-exit-if-changed]
```

Other [CLI](https://github.com/google/google-java-format) arguments are also supported. 

You can also use Coursier to get the list of options.
```
cs launch com.google.googlejavaformat:google-java-format:1.9 -- --help
```

### Notes about the `ktlint` hook

Minimum required arguments for the hook:

```yaml
    - id: ktlint
      args: [--format]
```

Other [CLI](https://ktlint.github.io/#getting-started) arguments are also supported. 

You can also use Coursier to get the list of options.
```
cs launch com.pinterest:ktlint:0.39.0 -M com.pinterest.ktlint.Main -- --help
```

### Notes about the `pmd` hook

Required arguments for the hook:

| Argument | Description |
| -------- | -------------------------------------------- |
| dir | Root directory for sources.                       |
| rulesets | Comma separated list of ruleset names to use.| 

```yaml
    - id: pmd
      args: [ -dir, src/main/java, -rulesets, pmd-ruleset.xml ]
```

Other [CLI](https://pmd.github.io/latest/pmd_userdocs_installation.html) arguments are also supported.
