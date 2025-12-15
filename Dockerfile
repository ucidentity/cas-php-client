FROM php:8.3-apache@sha256:38a67844f53fa238028448280c14f52dccc85e6ff18f252e3471c919c154c098

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget
RUN apt-get install -y git

# Set up php composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

COPY ./src/* /var/www/html

# Install phpCAS
RUN cd /var/www/html \
    && composer update

EXPOSE 80
