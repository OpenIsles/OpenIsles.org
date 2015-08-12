<?php

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
	'/screenshots.html' => array(
		'title' => 'Screenshots',
		'template' => 'more-to-come.tpl',
		'navsActive' => array('screenshots')
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