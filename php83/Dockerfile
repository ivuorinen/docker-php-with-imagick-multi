# vim: set ft=dockerfile ts=2 sw=2 sts=2 et:
FROM php:8.3@sha256:2643907fd60518306cfe9b68ac1e969065e55362b685b16b1c2b333af1e494ef

LABEL \
  maintainer="Ismo Vuorinen <ismo@ivuorinen.net>" \
  version="1.0" \
  description="PHP 8.3 with Imagick and Composer"

USER www-data

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD php -v || exit 1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install PHP extensions and required libraries
RUN set -o pipefail \
  && apt-get update --no-cache \
  && apt-get install -y --no-install-recommends \
  libicu-dev \
  libxml2-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libonig-dev \
  libmagickwand-dev \
  python3-dev \
  unzip \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) \
  bcmath \
  intl \
  mbstring \
  pdo \
  xml \
  gd \
  exif \
  && docker-php-ext-configure pcntl \
  && docker-php-ext-install pcntl \
  && yes '' | pecl install imagick \
  && docker-php-ext-enable imagick \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN set -o pipefail \
  && curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer

# Verify installations
RUN set -o pipefail \
  && php --version \
  && composer --version
