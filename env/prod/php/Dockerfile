
FROM php:7.2-apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
                libjpeg62-turbo-dev \
                libmcrypt-dev \
                libpng-dev \
                libbz2-dev \
                libicu-dev \
                libxml2-dev \
                curl \
        	      dialog \
                git \
                wget \
                vim \
                tree \
                libpq-dev \
                mysql-client \
            && apt-get install -y libmagickwand-dev \
                --no-install-recommends \
            && pecl install imagick \
            && rm -r /var/lib/apt/lists/* \
            && docker-php-ext-enable imagick \
            && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
            && docker-php-ext-install gd opcache pdo_mysql zip openssl bz2 \
    && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer \
    && cd /usr/local/bin && curl https://drupalconsole.com/installer -L -o drupal.phar && mv drupal.phar drupal && chmod +x drupal \
    && a2enmod headers && a2enmod rewrite

ADD ./devops.prod.conf /etc/apache2/sites-available/000-default.conf
ADD ./php.ini /usr/local/etc/php/
