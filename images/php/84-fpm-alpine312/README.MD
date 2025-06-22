# PHP 8.4 FPM Alpine Docker Image

A production-ready PHP 8.4 FPM image based on Alpine 3.21, including essential PHP extensions and tools for modern web applications. **Nginx** and **Supervisor** are pre-installed, making this image ideal as a lightweight and flexible base for your PHP projects.

---

## Features

* **PHP 8.4 FPM** on Alpine 3.21
* Nginx web server included
* Supervisor for process management
* **Common extensions:** GD (with WebP/JPEG/PNG support), Opcache, Intl, Redis, Imagick, Zip, PDO\_MySQL, and more
* Production-focused Opcache settings
* Ready for custom configuration via included sample configs

---

## Usage

### **Docker Hub**

```sh
docker pull tomaskrcal99/php:8.4-fpm-alpine3.21
```

### **Dockerfile Example**

You can use this image as a base for your own projects:

```dockerfile
FROM tomaskrcal99/php:8.4-fpm-alpine3.21

COPY . /var/www
```

---

## Exposed Ports

* **80** (Nginx HTTP)
* **443** (Nginx HTTPS)

---

## Environment Variables

* `PHP_OPCACHE_VALIDATE_TIMESTAMPS` (default: `0`)
* `PHP_OPCACHE_MAX_ACCELERATED_FILES` (default: `10000`)
* `PHP_OPCACHE_MEMORY_CONSUMPTION` (default: `192`)
* `PHP_OPCACHE_MAX_WASTED_PERCENTAGE` (default: `10`)

---

## Included Software

* **PHP Extensions:**

  * GD (with Freetype, JPEG, WebP)
  * Opcache
  * Redis
  * Intl
  * PDO, PDO\_MySQL, MySQLi
  * Zip
  * Imagick
* **System tools:** Nginx, Supervisor, Git, Curl, ICU, ImageMagick

---

## Custom Configuration

This image copies your configuration files:

* `config/php.ini` → `/usr/local/etc/php/conf.d/custom.ini`
* `config/nginx.conf` → `/etc/nginx/nginx.conf`

Override these as needed in your project or with your own Dockerfile.

---

## Example `docker run`

```sh
docker run -p 8080:80 -v $(pwd):/var/www tomaskrcal99/php:8.4-fpm-alpine3.21
```

---

## Building Manually

Clone this repo and build the image:

```sh
docker build -t my-php-app:latest images/php/84-fpm-alpine312
```

---

## License

MIT

---

## Credits

Created by [Tomáš Krčál](https://github.com/tomaskrcal99)
Feel free to submit PRs or issues!
