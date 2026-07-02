FROM php:8.5-apache@sha256:098cbb56b025956f6aec60e35c4e4c8c8dc15359b6a215de4868a9aec2092dce

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
