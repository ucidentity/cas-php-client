# cas-php-example

Derived from: https://github.com/apereo/phpCAS/tree/master/docs/examples

This example is not intended for use in production.

## Running

```shell
git pull https://github.com/ucidentity/cas-php-example
cd cas-php-example
docker build --tag=cas-php .
docker run -p 8000:80 cas-php
```

Go to http://localhost:8000
