<?php

/**
 * @return array Videos
 */
function getVideos() {
	return array(
		array(
			'date' => '2015-05-17',
			'fileprefix' => 'growth-2015-05-17',
			'description' => array(
				'de' => 'Zeigt den Wachstumsalgorithmus. Es werden Wälder und Felder gebaut und dann kann man zugucken, wie alles wächst.',
				'en' => 'Shows the growing algorithm. Forest and fields are built and one can watch them growing.'
			)
		),
		array(
			'date' => '2014-10-14',
			'fileprefix' => 'carrier-animation-2014-10-14',
			'description' => array(
				'de' => 'Sehr früher Entwicklungsstand, wie sich zum ersten Mal was bewegt. Im Video sind die ersten Schritte eines Trägers zu sehen.',
				'en' => 'Very early stage of development when something is moving for the first time. The video shows a carrier taking his first steps.'
			)
		)
	);
}