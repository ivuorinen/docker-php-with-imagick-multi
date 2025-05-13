# vim: set ft=dockerfile ts=2 sw=2 sts=2 et:
FROM php:7.4@sha256:620a6b9f4d4feef2210026172570465e9d0c1de79766418d3affd09190a7fda5

LABEL \
  maintainer="Ismo Vuorinen <ismo@ivuorinen.net>" \
  version="1.0" \
  description="PHP 7.4 with Imagick and Composer"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install PHP extensions and required libraries
RUN \
  apt-get update \
  && apt-get install -y --no-install-recommends \
  libicu-dev=* \
  libxml2-dev=2.* \
  libfreetype6-dev=2.* \
  libjpeg62-turbo-dev=* \
  libpng-dev=1.* \
  libonig-dev=6.* \
  libmagickwand-dev=8:6.* \
  python3-dev=3.* \
  unzip=6.* \
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

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD php -v || exit 1

USER www-data
