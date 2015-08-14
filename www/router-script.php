<?php

/**
 * Router-Script, um FrontController via PHP's built-in Webserver ansteuern zu können
 * @see http://php.net/manual/en/features.commandline.webserver.php#example-413
 *
 * Info: In IntelliJ "Custom working directory" ebenfalls auf "OpenIsles.org/www" setzen, sonst gehts nicht.
 */

if (preg_match('/\.(?:png|jpeg|css|js|ogv)$/', $_SERVER['REQUEST_URI'])) {
	return false;
} else {
	$disablePiwik = true; // kein Piwik-Aufruf, wenn wir lokal entwickeln
	include(__DIR__ . '/index.php');
}