# docker-php

Docker && Apache && Php && Mysql (mysql | pdo_mysql) && Mssql (mssql | pdo_dblib | freetds) && PhpMyAdmin

## Requirements

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)

## About this docker's settings

- apache
- php:5.6
- mysql
- pdo_mysql
- mssql
- pdo_dblib
- freetds
- rewrite
- zlib
- sockets
- phpmyadmin
- mariadb

## Installation

```bash
docker-compose up -d --build --force-recreate --remove-orphans
```

## Document Root

```
www
|- index-info.php
```

## Server Root

```
localhost:8086
```

## PhpMyAdmin

```
localhost:8087
```
