#Deriving the latest base image
FROM php:7.4-fpm-alpine

WORKDIR /app

COPY .env.example .env

COPY . .

RUN composer update && \
    composer install && \
    npm install && \
    php artisan key:generate && \
    rm -rf /var/lib/apt/lists/*