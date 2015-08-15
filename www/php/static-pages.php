<?php

/**
 * @return array statische Seiten
 */
function getStaticPages() {
	return array(
		'/' => array(
			'template' => 'home.tpl',
			'navsActive' => array('home')
		),
		'/faq.html' => array(
			'template' => 'faq.tpl',
			'navsActive' => array('faq')
		),
		'/media.html' => array(
			'template' => 'media.tpl',
			'navsActive' => array('media')
		),
		'/game-infos.html' => array(
			'template' => 'game-infos.tpl',
			'navsActive' => array('game-infos')
		),
		'/game-infos/goods.html' => array(
			'template' => 'game-infos/goods.tpl',
			'navsActive' => array('game-infos', 'game-infos/goods')
		),
		'/game-infos/buildings.html' => array(
			'template' => 'game-infos/buildings.tpl',
			'navsActive' => array('game-infos', 'game-infos/buildings')
		),
		'/game-infos/inhabitants.html' => array(
			'template' => 'game-infos/inhabitants.tpl',
			'navsActive' => array('game-infos', 'game-infos/inhabitants')
		),
		'/game-infos/ships.html' => array(
			'template' => 'game-infos/ships.tpl',
			'navsActive' => array('game-infos', 'game-infos/ships')
		),
		'/contact.html' => array(
			'template' => 'contact.tpl'
		),
		'/privacy.html' => array(
			'template' => 'privacy.tpl'
		)
	);
}