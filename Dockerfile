FROM php:8.3-apache@sha256:d9bfe53cbe358ab5c43144991fb7b95ffb84180ae947a5e4dc3e7a095605742d

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
