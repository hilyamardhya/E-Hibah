FROM mlocati/php-extension-installer:latest AS installer

FROM php:8.3-fpm-alpine

# Salin script installer instan
COPY --from=installer /usr/bin/install-php-extensions /usr/bin/
RUN apk add --no-cache bash

# Install ekstensi via pre-compiled binary (Hitungan detik selesai!)
RUN install-php-extensions pdo_mysql bcmath gd ldap

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
USER root
