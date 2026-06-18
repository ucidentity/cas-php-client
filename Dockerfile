FROM php:8.5-apache@sha256:65094755171975e565538ddbfa589847548e80d15adfbb9064a20b86f8485215

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
