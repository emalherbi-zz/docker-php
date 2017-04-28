FROM php:5.6-apache
MAINTAINER Eduardo Malherbi <emalherbi@gmail.com>

# mssql
RUN apt-get update && apt-get install -y freetds-dev && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure mssql --with-libdir=lib/x86_64-linux-gnu && docker-php-ext-install mssql

# mysql
RUN docker-php-ext-install mysql
RUN docker-php-ext-install pdo_mysql

# Edit 000-default.conf to change apache site settings.
ADD 000-default.conf /etc/apache2/sites-available/

# Uncomment these two lines to fix "non-UTF8" chars encoding and time format problems
ADD freetds.conf /etc/freetds/
ADD locales.conf /etc/freetds/

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
