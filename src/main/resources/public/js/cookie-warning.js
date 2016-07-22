/**
 * Zeigt einmalig ein Warn-Fenster an, dass die Webseite Cookies nutzt.
 */
$(function() {
    // Bootstrap's "Klick außerhalb zum Schließen" deaktivieren
    $.fn.modal.Constructor.Default.keyboard = false;
    $.fn.modal.Constructor.Default.backdrop = 'static';

    var $cookieWarning = $('#cookie-warning');
    var $closeButton = $cookieWarning.find('.close');

    // ESC-Taste schließt das Popup
    $(document).keyup(function(e) {
        if (e.keyCode == 27) {
            $closeButton.click();
        }
    });

    // Beim Schließen den jQueryUI-Effekt nutzen
    $closeButton.click(function() {
        if ($cookieWarning.is(':visible')) {
            $cookieWarning.find('.modal-dialog').effect('transfer', {
                className: 'ui-effects-transfer-cookie-warning',
                to: $('#cookie-warning-button')
            }, function() {
                $cookieWarning.modal('hide');
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

        $cookieWarning.modal('show');
        $cookieWarning.data('timeoutId', timeoutId);

        // Bootstrap's internes Event deaktivieren. Es würde da Popup schließen, bevor unsere Animation abgespielt wird.
        // Stattdessen registrieren wir unseren eigenen Handler.
        $cookieWarning.off(Event.CLICK_DISMISS);
        $cookieWarning.click(function(e) {
            // Eventbubbling ignorieren. Ein Klick ins Fenster soll es NICHT schließen
            if ($(e.target).is($cookieWarning)) {
                $closeButton.click();
                return false;
            }
        });
    };

    // Manuelles Öffnen des Popups
    $('#cookie-warning-button').click(function() {
        openCookieWarning(false);
        return false;
    });

    // Grundsätzlich die Warnung nicht anzeigen? (Google&Co sollen sie niemals sehen!)
    if ($('body').hasClass('no-cookie-warning')) {
        return;
    }

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