# docker-php-with-imagick-multi

[![Build](https://github.com/ivuorinen/docker-php-with-imagick-multi/actions/workflows/docker-image.yml/badge.svg)](https://github.com/ivuorinen/docker-php-with-imagick-multi/actions/workflows/docker-image.yml)
[![License](https://img.shields.io/github/license/ivuorinen/docker-php-with-imagick-multi)](https://github.com/ivuorinen/docker-php-with-imagick-multi)
[![Last Commit](https://img.shields.io/github/last-commit/ivuorinen/docker-php-with-imagick-multi)](https://github.com/ivuorinen/docker-php-with-imagick-multi/commits/main)

Multi-architecture Docker images for PHP 7.4 through 8.5 with Imagick and Composer pre-installed.

## Available Images

| PHP Version | Tag     | Pull Command                                                        |
| ----------- | ------- | ------------------------------------------------------------------- |
| PHP 7.4     | `php74` | `docker pull ghcr.io/ivuorinen/docker-php-with-imagick-multi:php74` |
| PHP 8.0     | `php80` | `docker pull ghcr.io/ivuorinen/docker-php-with-imagick-multi:php80` |
| PHP 8.1     | `php81` | `docker pull ghcr.io/ivuorinen/docker-php-with-imagick-multi:php81` |
| PHP 8.2     | `php82` | `docker pull ghcr.io/ivuorinen/docker-php-with-imagick-multi:php82` |
| PHP 8.3     | `php83` | `docker pull ghcr.io/ivuorinen/docker-php-with-imagick-multi:php83` |
| PHP 8.4     | `php84` | `docker pull ghcr.io/ivuorinen/docker-php-with-imagick-multi:php84` |
| PHP 8.5     | `php85` | `docker pull ghcr.io/ivuorinen/docker-php-with-imagick-multi:php85` |

## Architectures

- `linux/amd64`
- `linux/arm64`

## Included Software

### PHP Extensions

| Extension  | Description                        |
| ---------- | ---------------------------------- |
| bcmath     | Arbitrary precision mathematics    |
| intl       | Internationalization (ICU)         |
| mbstring   | Multibyte string handling          |
| pdo        | PHP Data Objects database layer    |
| xml        | XML parsing and manipulation       |
| gd         | Image processing (freetype + jpeg) |
| exif       | Image metadata reading             |
| pcntl      | Process control                    |
| imagick    | ImageMagick bindings (via PECL)    |

### System Libraries

| Library            | Purpose                     |
| ------------------ | --------------------------- |
| libicu-dev         | ICU for intl extension      |
| libxml2-dev        | XML parsing                 |
| libfreetype6-dev   | Font rendering (GD)         |
| libjpeg62-turbo-dev| JPEG support (GD)           |
| libpng-dev         | PNG support (GD)            |
| libonig-dev        | Oniguruma regex (mbstring)  |
| libmagickwand-dev  | ImageMagick C API (imagick) |

### Tools

- **Composer** (latest, installed to `/usr/local/bin/composer`)

## Usage

Pull an image:

```sh
docker pull ghcr.io/ivuorinen/docker-php-with-imagick-multi:php84
```

Run a container:

```sh
docker run --rm ghcr.io/ivuorinen/docker-php-with-imagick-multi:php84 php -v
```

Use as a base image in your Dockerfile:

```dockerfile
FROM ghcr.io/ivuorinen/docker-php-with-imagick-multi:php84
COPY . /app
WORKDIR /app
RUN composer install --no-dev
```

## Building Locally

```sh
docker build -t my-php84 ./php84/
```

## License

See [LICENSE](LICENSE) for details.
