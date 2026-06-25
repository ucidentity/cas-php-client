FROM php:8.5-apache@sha256:c6e17deefe4b7f79fd6a826a3d5f61f28035c3a7c12a1b446bf45f0e07bee9b2

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
