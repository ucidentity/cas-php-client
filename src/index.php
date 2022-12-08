<?php

// Load our settings
require_once 'config.php';

// Autoload classes
require_once 'vendor/autoload.php';

// Enable debugging
phpCAS::setLogger();

// Initialize phpCAS
phpCAS::client(SAML_VERSION_1_1, $cas_host, $cas_port, $cas_context, $client_service_name);

// Critical to authenticate the CAS server
phpCAS::setCasServerCACert($cas_server_ca_cert_path);

// Use this on any page that requires AuthN
phpCAS::forceAuthentication();

// logout if desired
if (isset($_REQUEST['logout'])) {
	phpCAS::logout();
}

?>
<html>
  <head>
    <title>phpCAS Example with Attributes</title>
  </head>
  <body>
<h2>phpCAS Example with Attributes</h2>
<?php require 'script_info.php' ?>

Authentication succeeded for user
<strong><?php echo phpCAS::getUser(); ?></strong>.

<h3>User Attributes</h3>
<ul>
<?php
foreach (phpCAS::getAttributes() as $key => $value) {
    if (is_array($value)) {
        echo '<li>', $key, ':<ol>';
        foreach ($value as $item) {
            echo '<li><strong>', $item, '</strong></li>';
        }
        echo '</ol></li>';
    } else {
        echo '<li>', $key, ': <strong>', $value, '</strong></li>' . PHP_EOL;
    }
}
    ?>
</ul>
<p><a href="?logout=">Logout</a></p>
</body>
</html>