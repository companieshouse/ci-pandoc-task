# ci-pandoc-task

This repository contains a minimal Docker image that can be used to run
[pandoc](https://pandoc.org/). The image is based on `alpine:3.12`.

## Build Args

* `PANDOC_VERSION` - The version of ShellCheck to install. Defaults to `3.1.3`.

## Entrypoint

The entrypoint is set to `/bin/bash`.
