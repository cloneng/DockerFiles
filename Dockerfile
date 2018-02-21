FROM php:5.6-apache

MAINTAINER NG

RUN docker-php-ext-install mbstring pdo pdo_mysql opcache

RUN a2enmod rewrite

COPY etc-php/php.ini /usr/local/etc/php

RUN apt-get update

RUN apt-get install -y wget zip unzip

COPY composer-install.sh /tmp

RUN /tmp/composer-install.sh && cp /usr/local/bin/composer.phar /usr/local/bin/composer