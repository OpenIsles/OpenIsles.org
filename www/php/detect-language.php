<?php

/**
 * Überprüft, mit welcher Sprache der Nutzer bedient werden will und gibt diese zurück.
 * Ist keine Sprache in der Subdomain angegeben, wird eine HTTP-Weiterleitung durchgeführt.
 *
 * @param $targetHostName string echter Hostname (je nach Umgebung) - sprachneutral
 * @param $acceptedLanguages string[] Array mit erlaubten Sprachkürzeln
 * @return string erkannte Sprache, wenn der Nutzer die Subdomain aufgerufen;
 *                ansonsten kehrt die Funktion nie zurück, sondern macht einen Redirect.
 */
function detectLanguage($targetHostName, $acceptedLanguages) {
	$httpHost = (isset($_SERVER['HTTP_HOST'])) ? $_SERVER['HTTP_HOST'] : '';

	// Subdomain mit Sprachen abgleichen
	foreach ($acceptedLanguages as $acceptedLanguage) {
		if ($httpHost == $acceptedLanguage.'.'.$targetHostName) {
			return $acceptedLanguage;
		}
	}

	// Keine oder ungültige Subdomain? Dann HTTP-Header auswerten und weiterleiten
	$httpAcceptLanguage = (isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) ? $_SERVER['HTTP_ACCEPT_LANGUAGE'] : '';

	// @see http://www.thefutureoftheweb.com/blog/use-accept-language-header
	if (preg_match_all('/([a-z]+(-[a-z]+)?)\s*(;\s*q\s*=\s*(1|0\.[0-9]+))?/i', $httpAcceptLanguage, $matches) &&
		count($matches[1])) {

		$langToQMap = array_combine($matches[1], $matches[4]);

		// keine q-Angabe? Dann 1 setzen
		foreach ($langToQMap as $lang => $q) {
			if ($q === '') {
				$langToQMap[$lang] = 1;
			}
		}

		arsort($langToQMap, SORT_NUMERIC);

		// Besten Treffer nehmen, den wir erkennen
		foreach ($langToQMap as $lang => $q) {
			foreach ($acceptedLanguages as $acceptedLanguage) {
				if (substr($lang, 0, strlen($acceptedLanguage)) == $acceptedLanguage) {
					$siteLanguage = $acceptedLanguage;
					break 2;
				}
			}
		}
	}

	// Keine Sprache erkennt, dann Deutsch nehmen
	if (!isset($siteLanguage)) {
		$siteLanguage = 'de';
	}

	// Weiterleitung machen
	header("Location: http://$siteLanguage.$targetHostName{$_SERVER['REQUEST_URI']}");
	exit;
}