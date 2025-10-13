FROM php:8.3-apache@sha256:40d0493cd5d87138f942ea4c38df4179f7f6b0852dfdf6724cbb0b906e6eed2f

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
