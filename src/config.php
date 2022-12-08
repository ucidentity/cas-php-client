<?php

// CAS Server Info
$cas_host = 'auth.berkeley.edu';
$cas_context = '/cas';
$cas_port = 443;

// Issuing certificate.  Path may differ depending on server OS / Docker image
$cas_server_ca_cert_path = '/etc/ssl/certs/USERTrust_RSA_Certification_Authority.pem';


// Application URL.  CAS server uses this to identify permitted client applications.
// Change this to production URL (e.g. https://myapp.berkeley.edu)
$client_service_name = 'http://127.0.0.1:8000';

// Client config for cookie hardening
$client_domain = '127.0.0.1';
$client_path = 'phpcas';
$client_secure = true;
$client_httpOnly = true;
$client_lifetime = 0;

?>