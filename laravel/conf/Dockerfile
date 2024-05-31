FROM php:8.3-fpm-alpine

# Встановлення залежностей
RUN apk update && apk add --no-cache \
    build-base \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    bash \
    vim \
    git \
    curl \
    zip \
    unzip \
    autoconf \
    g++ \
    make \
    oniguruma-dev \
    libzip-dev \
    openssl-dev \
    shadow

# Встановлення розширень PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd pdo_mysql mbstring zip exif pcntl

# Встановлення Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Встановлення робочої директорії
WORKDIR /var/www/laravel

# Копіювання файлів з хостової машини до контейнера
COPY ./src /var/www/laravel

# Створення необхідних директорій і встановлення прав доступу
RUN mkdir -p /var/www/laravel/storage /var/www/laravel/bootstrap/cache && \
    chown -R www-data:www-data /var/www/laravel && \
    chmod -R 775 /var/www/laravel/storage /var/www/laravel/bootstrap/cache

# Встановлення залежностей проекту
RUN composer install --no-interaction --prefer-dist --optimize-autoloader
