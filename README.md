# cas-php-example

Derived from: https://github.com/apereo/phpCAS/tree/master/docs/examples

This example is not intended for use in production.

## Environment Variables

You can specify the following environment variables to control how the PHP application works:

```shell
CAS_HOST = 'cas-host'
CAS_CONTEXT = '/cas'
CAS_PORT = 8443
CAS_SERVER_CA_PATH = '/etc/ssl/certs/USERTrust_RSA_Certification_Authority.pem'
CAS_VERSION=[CAS_VERSION_3_0, CAS_VERSION_2_0, SAML_VERSION_1_1]
CLIENT_SERVICE_NAME='http://cas-client:8000'
CAS_SKIP_SERVER_VALIDATION
```

## Running

```shell
git pull https://github.com/ucidentity/cas-php-example
cd cas-php-example
docker build --tag=cas-php .
docker run -p 8000:80 cas-php
```

Go to http://localhost:8000
