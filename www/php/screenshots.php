<?php

/**
 * Liefert alle Screenshots zurück
 *
 * @return array Screenshots
 */
function getScreenshots() {
	global $DB, $siteLanguage;

	$res = $DB->query("
		SELECT url_name, title_{$siteLanguage} AS title, description_{$siteLanguage} AS description, created_date
		FROM screenshot
		ORDER BY order_index DESC
	");
	$screenshots = $res->fetch_all(MYSQLI_ASSOC);

	// Thumbnails erzeugen, wenn nicht vorhanden
	foreach ($screenshots as $screenshot) {
		$urlName = $screenshot['url_name'];
		$imageFile = "{$_SERVER['DOCUMENT_ROOT']}/static/media/screenshots/$urlName.png";
		$thumbnailFile = "{$_SERVER['DOCUMENT_ROOT']}/static/media/screenshots/thumbnails/$urlName.thumb.png";

		if (!file_exists($thumbnailFile)) {
			exec("convert -geometry 200x $imageFile $thumbnailFile");
		}
	}
	$res->free();

	return $screenshots;
}


/**
 * Lädt die Daten für einen bestimmten Screenshot
 *
 * @param $urlName string URL-Teil des Screenshots
 * @return array Daten des Screenshots oder null, wenn der Screenshot nicht existiert
 */
function getScreenshot($urlName) {
	global $DB, $siteLanguage;

	// eigentlicher Screenshot

	$stmt = $DB->prepare("
		SELECT
			url_name,
			title_{$siteLanguage} AS title, description_{$siteLanguage} AS description, created_date, order_index
		FROM screenshot
		WHERE url_name = ?
	");
	$stmt->bind_param('s', $urlName);
	$stmt->execute();

	$res = $stmt->get_result();
	$screenshot = $res->fetch_assoc();
	$res->free();

	if ($screenshot == null) {
		return null;
	}

	// vorheriger Screenshot

	$stmt = $DB->prepare("
		(
			SELECT
				url_name, title_{$siteLanguage} AS title, description_{$siteLanguage} AS description,
				created_date, order_index
			FROM screenshot
			WHERE order_index > ?
			ORDER BY order_index ASC
			LIMIT 1
		) UNION (
			SELECT
				url_name, title_{$siteLanguage} AS title, description_{$siteLanguage} AS description,
				created_date, order_index
			FROM screenshot
			WHERE order_index = (SELECT MIN(order_index) FROM screenshot)
		)
		ORDER BY order_index DESC
	");
	$stmt->bind_param('i', $screenshot['order_index']);
	$stmt->execute();

	$res = $stmt->get_result();
	$screenshot['prev'] = $res->fetch_assoc();
	$res->free();

	// nachfolgender Screenshot

	$stmt = $DB->prepare("
		(
			SELECT
				url_name, title_{$siteLanguage} AS title, description_{$siteLanguage} AS description,
				created_date, order_index
			FROM screenshot
			WHERE order_index < ?
			ORDER BY order_index DESC
			LIMIT 1
		) UNION (
			SELECT
				url_name, title_{$siteLanguage} AS title, description_{$siteLanguage} AS description,
				created_date, order_index
			FROM screenshot
			WHERE order_index = (SELECT MAX(order_index) FROM screenshot)
		)
		ORDER BY order_index ASC
	");
	$stmt->bind_param('i', $screenshot['order_index']);
	$stmt->execute();

	$res = $stmt->get_result();
	$screenshot['next'] = $res->fetch_assoc();
	$res->free();

	return $screenshot;
}