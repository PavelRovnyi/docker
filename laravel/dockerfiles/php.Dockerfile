FROM php:8.3-fpm-alpine3.19

WORKDIR /var/www/laravel

RUN docker-php-ext-install pdo pdo_mysql

