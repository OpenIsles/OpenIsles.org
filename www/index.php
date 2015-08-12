<?php

// Datumsformat für Smarty auf Deutsch einstellen
setlocale(LC_TIME, 'de_DE.UTF-8', 'de_DE@euro', 'de_DE', 'de');

require_once('smarty/libs/Smarty.class.php');
$smarty = new Smarty;

// statische Seiten
$staticPages = array(
	'/' => array(
		'title' => null,
		'template' => 'home.tpl',
		'navsActive' => array('home')
	),
	'/faq.html' => array(
		'title' => 'FAQ',
		'template' => 'faq.tpl',
		'navsActive' => array('faq')
	),
	'/media.html' => array(
		'title' => 'Medien',
		'template' => 'media.tpl',
		'navsActive' => array('media')
	),
	'/game-infos.html' => array(
		'title' => 'Spielinfos',
		'template' => 'more-to-come.tpl',
		'navsActive' => array('game-infos')
	),
	'/game-infos/goods.html' => array(
		'title' => 'Waren',
		'template' => 'more-to-come.tpl',
		'navsActive' => array('game-infos', 'game-infos/goods')
	),
	'/game-infos/buildings.html' => array(
		'title' => 'Gebäude',
		'template' => 'more-to-come.tpl',
		'navsActive' => array('game-infos', 'game-infos/buildings')
	),
	'/game-infos/population.html' => array(
		'title' => 'Einwohner',
		'template' => 'more-to-come.tpl',
		'navsActive' => array('game-infos', 'game-infos/population')
	),
	'/game-infos/ships.html' => array(
		'title' => 'Schiffe',
		'template' => 'more-to-come.tpl',
		'navsActive' => array('game-infos', 'game-infos/ships')
	),
	'/contact.html' => array(
		'title' => 'Kontakt &amp; Impressum',
		'template' => 'contact.tpl',
		'navsActive' => array('contact')
	)
);

$requestUrl = $_SERVER['REQUEST_URI'];
$navsActive = array();

// statische Seiten
if (isset($staticPages[$requestUrl])) {
	$smarty->assign('title', $staticPages[$requestUrl]['title']);
	$pageContent = $smarty->fetch($staticPages[$requestUrl]['template']);

	if (isset($staticPages[$requestUrl]['navsActive'])) {
		foreach ($staticPages[$requestUrl]['navsActive'] as $navActive) {
			$navsActive[$navActive] = true;
		}
	}
}

// Screenshots
else if ($requestUrl == '/media/screenshots.html') {
	$screenshots = array(
		array(
			'date' => '2015-08-10 22:07:37',
			'fileprefix' => 'screenshot_2015-08-10_22-07-37',
			'description' => 'Refactoring "BuildOperation" abgeschlossen. Im Screenshot sieht man, wie sich bestehende und neue Straßenkacheln beim Bau anpassen (Kreuzung über die Pflasterstraße; Pflasterstraße oben wird zum T-Stück).'
		),
		array(
			'date' => '2015-07-19 08:48:13',
			'fileprefix' => 'screenshot_2015-07-19_08-48-13',
			'description' => 'Refactoring "BuildOperation": Hier ist ein Entwicklungszwischenstand vom Baumodus zu sehen. Die Kollisionerkennung beim Bau funktioniert (wieder).'
		),
		array(
			'date' => '2015-06-28 20:09:52',
			'fileprefix' => 'screenshot_2015-06-28_20-09-52',
			'description' => 'Rendering von Objekten mit Elevation 0 (d.&nbsp;h. sitzen auf dem Wasser, nicht der Insel). Hier ist die Anlegestelle zu sehen.'
		),
		array(
			'date' => '2015-05-14 20:45:25',
			'fileprefix' => 'screenshot_2015-05-14_20-45-25',
			'description' => '… und die zugehörigen Plantagen'
		),
		array(
			'date' => '2015-05-14 20:41:49',
			'fileprefix' => 'screenshot_2015-05-14_20-41-49',
			'description' => 'Zuckerrohr und Tabakfeld…'
		),
		array(
			'date' => '2015-04-13 15:45:14',
			'fileprefix' => 'screenshot_2015-04-13_15-45-14',
			'description' => 'Träger werden nun korrekt hinter Gebäuden gerendert.'
		),
		array(
			'date' => '2015-04-13 15:37:57',
			'fileprefix' => 'screenshot_2015-04-13_15-37-57',
			'description' => 'Alle Grafiken für die 5 Siedlerhäuser sind fertig.'
		),
		array(
			'date' => '2015-03-29 00:44:08',
			'fileprefix' => 'screenshot_2015-03-29_00-44-08',
			'description' => 'Bauen von Pfaden. Hier erkennt man deutlich, dass sich Straßenkacheln noch nicht anpassen (kein T-Stück).'
		),
		array(
			'date' => '2015-03-29 00:43:32',
			'fileprefix' => 'screenshot_2015-03-29_00-43-32',
			'description' => 'Bauen von Flächen. Hier sind die Plätze zu sehen.'
		),
		array(
			'date' => '2015-03-29 00:25:52',
			'fileprefix' => 'screenshot_2015-03-29_00-25-52',
			'description' => 'Waldkachel um das Forsthaus, wo man verschiedene Ansichten und Wachstumsstadien des Walds sieht'
		),
		array(
			'date' => '2015-03-29 00:25:23',
			'fileprefix' => 'screenshot_2015-03-29_00-25-23',
			'description' => 'Erste Grafik für den Wald'
		),
		array(
			'date' => '2015-03-19 21:13:29',
			'fileprefix' => 'screenshot_2015-03-19_21-13-29',
			'description' => 'Feldweggrafiken sind fertig'
		),
		array(
			'date' => '2015-03-15 20:42:27',
			'fileprefix' => 'screenshot_2015-03-15_20-42-27',
			'description' => '"Hoverobjekt" im Baumodus, wenn das zu bauende Gebäude keinen Platz hat'
		),
		array(
			'date' => '2015-03-15 20:41:30',
			'fileprefix' => 'screenshot_2015-03-15_20-41-30',
			'description' => 'mehrere Gebäude können nun auf einmal gebaut werden'
		),
		array(
			'date' => '2015-02-13 22:35:52',
			'fileprefix' => 'screenshot_2015-02-13_22-35-52',
			'description' => 'Screenshot mitten in der Entwicklung des Features "Drehung der Karte". Rendering komplett im Eimer.'
		),
		array(
			'date' => '2015-01-07 00:11:16',
			'fileprefix' => 'screenshot_2015-01-07_00-11-16',
			'description' => 'Alle Gebäude haben nun Grafiken für die vier Ansichten'
		),
		array(
			'date' => '2015-01-05 15:51:30',
			'fileprefix' => 'screenshot_2015-01-05_15-51-30',
			'description' => 'ein Rendering-Bug ;-)'
		),
		array(
			'date' => '2014-11-30 13:51:54',
			'fileprefix' => 'screenshot_2014-11-30_13-51-54',
			'description' => 'Siedlung, die alle Gebäudegrafiken zeigt, die es bis dahin gibt'
		),
		array(
			'date' => '2014-11-15 22:24:31',
			'fileprefix' => 'screenshot_2014-11-15_22-24-31',
			'description' => 'Pionierhäuser-Grafik verbessert'
		),
		array(
			'date' => '2014-11-12 16:05:11',
			'fileprefix' => 'screenshot_2014-11-12_16-05-11',
			'description' => 'Elevation fertig. Hier mit den neuen Küstengrafiken'
		),
		array(
			'date' => '2014-11-11 23:46:25',
			'fileprefix' => 'screenshot_2014-11-11_23-46-25',
			'description' => 'Elevation fertig. Hier noch die alten Küstengrafiken zu sehen'
		),
		array(
			'date' => '2014-10-28 00:03:40',
			'fileprefix' => 'screenshot_2014-10-28_00-03-40',
			'description' => 'Neu: Grafik für Werkzeugschmiede'
		),
		array(
			'date' => '2014-10-26 11:09:48',
			'fileprefix' => 'screenshot_2014-10-26_11-09-48',
			'description' => 'Pathfinding-Algorithmus berechnet eine Route, welche nur Straßen nutzt'
		),
		array(
			'date' => '2014-10-21 23:24:19',
			'fileprefix' => 'screenshot_2014-10-21_23-24-19',
			'description' => 'Schaffarmen und Webstuben mit den beiden neuen Waren "Wolle" und "Stoff"'
		),
		array(
			'date' => '2014-10-18 13:14:06',
			'fileprefix' => 'screenshot_2014-10-18_13-14-06',
			'description' => 'Pathfinding-Algorithmus fertig'
		),
		array(
			'date' => '2014-09-28 16:51:31',
			'fileprefix' => 'screenshot_2014-09-28_16-51-31',
			'description' => 'Java-Hilfsprogramm, was die Abhängigkeiten der Rendering-Reihenfolge darstellt'
		)
	);
	$smarty->assign('screenshots', $screenshots);

	$smarty->assign('title', 'Screenshots');
	$pageContent = $smarty->fetch('media/screenshots.tpl');

	$navsActive['media'] = true;
	$navsActive['media/screenshots'] = true;
}

// Videos
else if ($requestUrl == '/media/videos.html') {
	$smarty->assign('title', 'Videos');
	$pageContent = $smarty->fetch('more-to-come.tpl'); // TODO

	// TODO Videos

	$navsActive['media'] = true;
	$navsActive['media/videos'] = true;
}

// Download
else if ($requestUrl == '/download.html') {
	header("Location: https://github.com/OpenIsles/OpenIsles/archive/master.zip");
	exit;
}

// GitHib
else if ($requestUrl == '/github.html') {
	header("Location: https://github.com/OpenIsles/");
	exit;
}

// 404
else {
	$pageContent = $smarty->fetch('404.tpl');
}

$smarty->assign('navsActive', $navsActive);
$smarty->assign('pageContent', $pageContent);
$smarty->display('page-layout.tpl');