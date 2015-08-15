<?php

if (preg_match('~openisles.org.localhost$~', $_SERVER['SERVER_NAME'])) {
	// Lokale Entwicklung
	$targetHostName = 'openisles.org.localhost';
	$isLocalDevelopment = true;
} else {
	// Produktivbetrieb
	$targetHostName = 'openisles.org';
}

$acceptedLanguages = array('de', 'en');

// Smarty initialisieren
require_once('smarty/libs/Smarty.class.php');
$smarty = new Smarty;

if (isset($isLocalDevelopment)) {
	$smarty->setForceCompile(true); // Smarty zum Re-Compile der Templates zwingen, damit wir sofort F5 machen können.
	$smarty->assign('isLocalDevelopment', true);
}

// Sprache erkennen
include_once('php/detect-language.php');
$siteLanguage = detectLanguage($targetHostName, $acceptedLanguages);

// Sprache für Smarty einstellen
setlocale(LC_TIME,
	$siteLanguage.'_'.strtoupper($siteLanguage).'.UTF-8', // de_DE.UTF-8
	$siteLanguage.'_'.strtoupper($siteLanguage).'@euro',  // de_DE@euro
	$siteLanguage.'_'.strtoupper($siteLanguage).          // de_DE
	$siteLanguage                                         // de
);
$smarty->compile_id = $siteLanguage;
$smarty->assign('siteLanguage', $siteLanguage);

header("Content-Type: text/html; charset=UTF-8");
header("Content-Language: $siteLanguage");


// statische Seiten
include_once('php/static-pages.php');
$staticPages = getStaticPages();

$requestUrl = preg_replace('~(\?.*)$~', '', $_SERVER['REQUEST_URI']); // Query-String abschneiden

if (isset($staticPages[$requestUrl])) {
	if (isset($staticPages[$requestUrl]['navsActive'])) {
		$smarty->assign('navsActive', $staticPages[$requestUrl]['navsActive']);
	}
	$smarty->display($staticPages[$requestUrl]['template']);
}

// Screenshots
else if ($requestUrl == '/media/screenshots.html') {
	include_once('php/screenshots.php');
	$smarty->assign('screenshots', getScreenshots());

	$smarty->assign('navsActive', array('media' => true, 'media/screenshots' => true));
	$smarty->display('media/screenshots.tpl');
}

// Videos
else if ($requestUrl == '/media/videos.html') {
	include_once('php/videos.php');
	$smarty->assign('videos', getVideos());

	$smarty->assign('navsActive', array('media' => true, 'media/videos' => true));
	$smarty->display('media/videos.tpl');
}

// 404
else {
	$smarty->display('404.tpl');
}