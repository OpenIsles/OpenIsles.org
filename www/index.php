<?php

// Host detektieren
if (preg_match('~openisles.org(?:\.([^.]+))?$~', $_SERVER['SERVER_NAME'], $match)) {
	if ($match[1]) {
		// Lokale Entwicklung
		$targetHostName = "openisles.org.$match[1]";
		$isLocalDevelopment = true;
	} else {
		// Produktivbetrieb
		$targetHostName = 'openisles.org';
		$isLocalDevelopment = false;
	}
} else {
	die("Illegal Host {$_SERVER['SERVER_NAME']}");
}

$languageMap = array(
	'de' => 'Deutsch',
	'en' => 'English'
);
$acceptedLanguages = array_keys($languageMap);

// Smarty initialisieren
require_once('smarty/libs/Smarty.class.php');
$smarty = new Smarty;

if ($isLocalDevelopment) {
	$smarty->setForceCompile(true); // Smarty zum Re-Compile der Templates zwingen, damit wir sofort F5 machen können.
	$smarty->assign('isLocalDevelopment', true);
}

require_once('php/prefilter.translate.php');
$smarty->registerFilter('pre', 'smarty_prefilter_translate');

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
$smarty->assign('languageMap', $languageMap);

header("Content-Type: text/html; charset=UTF-8");
header("Content-Language: $siteLanguage");

$alternateUrls = array();
foreach ($acceptedLanguages as $lang) {
	$alternateUrls[$lang] = "http://$lang.$targetHostName{$_SERVER['REQUEST_URI']}";
}
$smarty->assign('alternateUrls', $alternateUrls);

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

// XML-Sitemap
else if ($requestUrl == '/sitemap.xml') {
	header("Content-Type: text/xml; charset=UTF-8");

	$smarty->display('sitemap.xml.tpl');
}

// 404
else {
	header($_SERVER['SERVER_PROTOCOL'].' 404 Not Found');
	$smarty->display('404.tpl');
}