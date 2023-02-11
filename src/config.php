<?php

// Defaults
$cas_host = 'localhost';
$cas_context = '/cas';
$cas_port = 8443;
$cas_version = '3';
// Issuing certificate.  Path may differ depending on server OS / Docker image
$cas_server_ca_cert_path = '/etc/ssl/certs/USERTrust_RSA_Certification_Authority.pem';
$cas_skip_server_validation = false;
// Application URL.  CAS server uses this to identify permitted client applications.
// Change this to production URL (e.g. https://myapp.berkeley.edu)
// For local development use localhost/127.0.0.1
$client_service_name = 'http://localhost:8000';

// Override defaults
foreach (getenv() as $key => $value) {
    if ($key == 'CAS_HOST') {
        $cas_host = $value;
    }
    if ($key == 'CAS_CONTEXT') {
        $cas_context = $value;
    }
    if ($key == 'CAS_PORT') {
        $cas_port = $value;
    }
    if ($key == 'CAS_SERVER_CA_PATH') {
        $cas_server_ca_cert_path = $value;
    }
    if ($key == 'CAS_VERSION') {
        $cas_version = $value;
    }
    if ($key == 'CAS_SKIP_SERVER_VALIDATION') {
        $cas_skip_server_validation = true;
    }
    if ($key == 'CLIENT_SERVICE_NAME') {
        $client_service_name = $value;
    }
}

// Client config for cookie hardening
$client_domain = '127.0.0.1';
$client_path = 'phpcas';
$client_secure = true;
$client_httpOnly = true;
$client_lifetime = 0;

?>
