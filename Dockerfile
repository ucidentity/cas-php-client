FROM php:8.3-apache@sha256:663798d91cdc21bfe36cf63e2bf6b1f47a39b828fd01c34cc83cc27bba63a9c2

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
