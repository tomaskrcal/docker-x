FROM php:8.4-fpm-alpine3.21

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0" \
    PHP_OPCACHE_MAX_ACCELERATED_FILES="10000" \
    PHP_OPCACHE_MEMORY_CONSUMPTION="192" \
    PHP_OPCACHE_MAX_WASTED_PERCENTAGE="10"

RUN apk update --no-cache && apk add --no-cache nginx \
    curl \
    icu-dev \
    git \
    supervisor \
    jpeg-dev \
    libwebp \
    libwebp-dev \
    zlib-dev \
    imagemagick \
    imagemagick-dev \
    $PHPIZE_DEPS \
	openssl-dev

RUN apk add --no-cache \
      freetype \
      libjpeg-turbo \
      libpng \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      --with-jpeg=/usr/include/ \
      --with-webp=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd \
    && apk del --no-cache \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && rm -rf /tmp/*

RUN docker-php-ext-install opcache

RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

RUN docker-php-ext-configure intl && docker-php-ext-install intl

RUN apk add libzip-dev zip \
  && docker-php-ext-install zip

RUN pecl install -o -f imagick \
    &&  docker-php-ext-enable imagick

COPY config/php.ini /usr/local/etc/php/conf.d/custom.ini
COPY config/nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www

EXPOSE 80 443
