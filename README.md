# cas-php-client

Derived from: https://github.com/apereo/phpCAS/tree/master/docs/examples

This example is not intended for use in production.

## Environment Variables

You can specify the following environment variables to control how the PHP application works:

```shell
CAS_HOST = 'cas-host'
CAS_CONTEXT = '/cas'
CAS_PORT = 8443
CAS_SERVER_CA_PATH = '/etc/ssl/certs/USERTrust_RSA_Certification_Authority.pem'
CAS_VERSION=['saml','1', '2', '3']
CLIENT_SERVICE_NAME='http://cas-client:8000'
CAS_SKIP_SERVER_VALIDATION
```

## Running

```shell
git pull https://github.com/ucidentity/cas-php-client
cd cas-php-client
docker build --tag=cas-php-client .
```

With Defaults

```shell
docker run -p 8000:80 cas-php-client
```

With env vars

```shell
docker run --rm \
    --publish 8000:80 \
    --env CAS_HOST=cas-host \
    --env CAS_PORT=8443 \
    --env CLIENT_SERVICE_NAME='http://cas-client:8000' \
    --env CAS_SKIP_SERVER_VALIDATION=true \
    --network cas-test \
    --env CAS_VERSION=3 \
    --name cas-client \
    ghcr.io/ucidentity/cas-php-client:latest 
```

Another example testing with a hosts file

```shell
docker run --rm \
    --publish 80:80 \
    --add-host=auth-test.berkeley.edu:169.229.218.106 \
    --env CAS_HOST=auth-test.berkeley.edu \
    --env CAS_PORT=443 \
    --env CLIENT_SERVICE_NAME='http://localhost' \
    --env CAS_SKIP_SERVER_VALIDATION=true \
    --env CAS_VERSION=3 \
    --name cas-client \
    ghcr.io/ucidentity/cas-php-client:latest
```

Go to http://localhost:8000
