# vim: set ft=dockerfile ts=2 sw=2 sts=2 et:
FROM php:8.1@sha256:a57aba6a50bbb85fcd6fffaf45048c9f54a9cdec0e64d0cb5985d4d1a44e2634

LABEL \
  maintainer="Ismo Vuorinen <ismo@ivuorinen.net>" \
  version="1.0" \
  description="PHP 8.1 with Imagick and Composer"

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
