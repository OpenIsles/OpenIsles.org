/**
 * Zeigt einmalig ein Warn-Fenster an, dass die Webseite Cookies nutzt.
 */
$(function() {
	var $cookieWarning = $('#cookie-warning');
	var $closeButton = $cookieWarning.find('.close-reveal-modal');

	// Ein wenig Magic ist notwendig, um Foundation's Schließen mit einem jQueryUI-Effekt zu verbinden:
	// Wir deaktivieren die eingebauten Mechanismen für Schließen und bauen sie nach.
	$cookieWarning.foundation({
		reveal: {
			animation: null,
			close_on_esc: false,
			close_on_background_click: false
		}
	});

	// ESC-Taste schließt das Popup
	$(document).keyup(function(e) {
		if (e.keyCode == 27) {
			$closeButton.click();
		}
	});

	// Beim Schließen den jQueryUI-Effekt nutzen
	$closeButton.click(function() {
		if ($cookieWarning.is(':visible')) {
			$cookieWarning.effect('transfer', {
				className: 'ui-effects-transfer-cookie-warning',
				to: $('#cookie-warning-button')
			}, function() {
				$cookieWarning.foundation('reveal', 'close');
			});
		}

		// Wenn noch ein Timeout läuft, abbrechen
		var timeoutId = $cookieWarning.data('timeoutId');
		if (timeoutId) {
			clearTimeout(timeoutId);
			$cookieWarning.removeData('timeoutId');
		}

		return false;
	});

	var openCookieWarning = function(autoClose) {
		if (autoClose) {
			// Popup schließt sich außerdem automatisch nach einer angemessenen Zeit zum Lesen des Texts
			var timeoutId = setTimeout(function() {
				$closeButton.click();
			}, 30000);
		}

		$cookieWarning.foundation('reveal', 'open');
		$cookieWarning.data('timeoutId', timeoutId);

		// Click außerhalb schließt das Popup
		// (Handler einmalig nach dem Öffnen registrieren, da .reveal-modal-bg dynamisch erzeugt wird)
		var $revealModelBg = $('.reveal-modal-bg');
		if (!($revealModelBg.data('hasClickHandler'))) {
			$revealModelBg.data('hasClickHandler', true);
			$revealModelBg.click(function() {
				$closeButton.click();
			});
		}
	};

	// Manuelles Öffnen des Popups
	$('#cookie-warning-button').click(function() {
		openCookieWarning(false);
		return false;
	});

	// Automatisches Öffnen des Popups beim ersten Besuch
	var hasSeenCookieWarning;

	// Im Local-Storage nachsehen, ob der Nutzer die Warnung schon gesehen hat.
	if (window.localStorage) {
		hasSeenCookieWarning = window.localStorage.getItem("hasSeenCookieWarning");
	}

	// Wer keinen Local-Storage hat (Uralt-Browser oder Local-Storage geblockt -> Pech gehabt),
	// sieht die Warnung eben jedes Mal :-p
	if (hasSeenCookieWarning == null) {
		hasSeenCookieWarning = false;
	}

	if (hasSeenCookieWarning) {
		return;
	}

	// Merken, damit der Nutzer die Warnung nie wieder sieht.
	if (window.localStorage) {
		window.localStorage.setItem("hasSeenCookieWarning", "true");
	}

	// Warnung nun anzeigen...
	openCookieWarning(true);
});