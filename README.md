# docker-cakephp

Docker container for [CakePHP](https://cakephp.org/).

Based on the official Docker image, [php:\<version>-apache](https://hub.docker.com/_/php).

**Quick start of development** - CakePHP is a great framework, but to start using it, you need to set up php, some extensions, a web server such as apache or nginx and more. This container comes with all that already in place and acts as a kitchen to bake a cake.

## Run tests (for local)

Before run tests locally, install [act](https://github.com/nektos/act).

```sh
act -j test -P ubuntu-18.04=nektos/act-environments-ubuntu:18.04
```
