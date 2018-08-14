FROM php:5.6-apache
MAINTAINER Eduardo Malherbi <emalherbi@gmail.com>

# utils
RUN apt-get update && \
    apt-get install -y apt-utils freetds-dev sendmail libpng-dev zlib1g-dev

# zip, socket, mbstring
RUN docker-php-ext-install zip sockets mbstring gd

# mysql / mysqli
RUN docker-php-ext-install mysql mysqli pdo_mysql

# mssql
RUN docker-php-ext-configure mssql --with-libdir=lib/x86_64-linux-gnu && \
    docker-php-ext-install mssql

RUN docker-php-ext-configure pdo_dblib --with-libdir=lib/x86_64-linux-gnu && \
    docker-php-ext-install pdo_dblib

# rewrite
RUN a2enmod rewrite

# remove list
RUN rm -rf /var/lib/apt/lists/*

# 000-default.conf to change apache site settings.
ADD 000-default.conf /etc/apache2/sites-available/

# Ini
COPY php.ini /usr/local/etc/php/

# Uncomment these two lines to fix "non-UTF8" chars encoding and time format problems
ADD freetds.conf /etc/freetds/
ADD locales.conf /etc/freetds/

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
