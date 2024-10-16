#Deriving the latest base image
FROM php:7.4-fpm-alpine

WORKDIR /app

COPY .env.example .env

COPY . .

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends software-properties-common gnupg2 wget && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends php7.0 php7.0-curl php7.0-xml php7.0-zip php7.0-gd php7.0-mbstring php7.0-mysql && \
    apt-get update -y && \
    apt-get install -y composer && \
    composer update && \
    composer install && \
    npm install && \
    php artisan key:generate && \
    rm -rf /var/lib/apt/lists/*