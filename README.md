# docker-cakephp

Docker container for [CakePHP](https://cakephp.org/).

Based on the official Docker image, [php:\<version>-apache](https://hub.docker.com/_/php).

**Quick start of development** - CakePHP is a great framework, but to start using it, you need to set up php, some extensions, a web server such as apache or nginx and more. This container comes with all that already in place and acts as a kitchen to bake a cake.

## Usage

### Create a Dockerfile in your project

```dockerfile
FROM sukun1899/cakephp:4-php8

COPY . /var/www/cake_app
WORKDIR /var/www/cake_app
```

Then, run the commands to build and run the Docker image:

```console
$ docker build -t my-cake-app .
$ docker run -p 8080:80 -it --rm --name my-running-cake-app my-cake-app
```

### Run your application directly

You can run your cakePHP application using the Docker image directly:

```console
$ docker run -p 8080:80 --rm --name my-running-cake-app -v "$(pwd)":/var/www/cake_app sukun1899/cakephp:4-php8
```

### Create docker-compose.yml

Usually you will use a database, so docker-compose may be useful.

The following is example.

```yaml
version: "3.9"
services:
  web:
    container_name: my-cake-app
    image: sukun1899/cakephp:4-php8
    ports:
      - "8080:80"
    volumes:
      - .:/var/www/cake_app
  db:
    container_name: my-cake-db
    image: "mysql:8"
    ports:
      - "3306:3306"
    environment:
      MYSQL_DATABASE: my_app
      MYSQL_USER: my_app
      MYSQL_PASSWORD: secret
```

## Run tests (for local)

Before run tests locally, install [act](https://github.com/nektos/act).

```sh
act -j test -P ubuntu-18.04=nektos/act-environments-ubuntu:18.04
```
