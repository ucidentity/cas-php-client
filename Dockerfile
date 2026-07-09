FROM php:8.5-apache@sha256:ede24dfd13fe79fb8ea0d0bac0ac45827a9a540d2a16e45c047f9afaf69c3eaf

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget git unzip

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
