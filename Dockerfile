FROM php:8.3-apache@sha256:bf7ef03ad534118a0d5eff017ddf41fbc40bcaa1f2fa6c0ff24a64552209e10c

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
