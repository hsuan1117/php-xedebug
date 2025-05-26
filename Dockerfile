FROM php:latest

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get update -yqq
RUN apt-get install gnupg git nodejs libcurl4-gnutls-dev libicu-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev libonig-dev libzip-dev unzip -yqq
RUN docker-php-ext-install pdo_mysql intl gd zip bz2 opcache bcmath
RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN corepack yarn
RUN apt-get install docker.io -yqq