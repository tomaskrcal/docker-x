FROM tomaskrcal99/php:8.4-fpm-alpine3.21

COPY --from=node:22-alpine3.21 /usr/lib /usr/lib
COPY --from=node:22-alpine3.21 /usr/local/lib /usr/local/lib
COPY --from=node:22-alpine3.21 /usr/local/include /usr/local/include
COPY --from=node:22-alpine3.21 /usr/local/bin /usr/local/bin

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

EXPOSE 80 443

