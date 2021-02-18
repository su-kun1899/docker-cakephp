FROM php:8.0-apache

# setup apache configuration
COPY files/etc/apache2 /etc/apache2/
RUN set -eux; \
    a2enmod rewrite;

# setup php configuration
COPY files/usr/local/etc/php /usr/local/etc/php/
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# install apt packages
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
	    git libicu-dev libonig-dev libxml2-dev libzip-dev unzip; \
	rm -rf /var/lib/apt/lists/*;

# install php extentions
RUN docker-php-ext-install intl pdo_mysql zip

# install composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/cake_app
