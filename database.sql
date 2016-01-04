
CREATE TABLE screenshot (
    order_index INT UNSIGNED NOT NULL COMMENT 'fortlaufender Zähler für die Sortierreihenfolge',
    url_name VARCHAR(64) NOT NULL COMMENT 'URL-Teil ohne Dateiendung, der als URL verwendet. Außerdem entspricht es dem Dateinamen-Präfix des Bilds',
    title_de VARCHAR(92) NOT NULL COMMENT 'Titel (deutsch)',
    description_de VARCHAR(512) NOT NULL COMMENT 'Beschreibung (deutsch)',
    title_en VARCHAR(92) NOT NULL COMMENT 'Titel (englisch)',
    description_en VARCHAR(512) NOT NULL COMMENT 'Beschreibung (englisch)',
    created_date DATETIME NOT NULL COMMENT 'Zeitpunkt, wann der Screenshot angelegt wurde',
    PRIMARY KEY (url_name),
    UNIQUE KEY (order_index)
) ENGINE=MyISAM COLLATE=utf8_unicode_ci COMMENT='Screenshots';

INSERT INTO screenshot (order_index, url_name, title_de, description_de, title_en, description_en, created_date) VALUES
(
    34,
    '2016-01-03-demanded-goods',
    'Infopanel: verlangte Güter',
    'Das Infopanel zeigt nun schon mal die verlangten Güter an. Verbrauchslogik ist noch keine da.',
    'Info panel: Demanded goods',
    'The info panel meanwhile shows the demanded goods. There is no logic for consuming yet.',
    '2016-01-03 02:45:11'
), (
    33,
    '2015-12-28-i18n-poedit',
    'Internationisierung: Poedit mit deutscher Übersetzungsdatei',
    'Hier ist die deutsche Sprachdatei im Übersetzungseditor zu sehen.',
    'Internationalization: Poedit with German translation file',
    'Here you can see the German translation file in the translation editor.',
    '2015-12-28 19:54:12'
), (
    32,
    '2015-12-28-i18n-english',
    'Internationisierung: Das Spiel auf Englisch',
    'Alle Phrasen im Spiel sind nun übersetzbar. Der Screenshot zeigt OpenIsles auf Englisch.',
    'Internationalization: The game in English',
    'All phrases in the game are now translatable. The screenshot shows OpenIsles in English.',
    '2015-12-28 19:50:42'
), (
    31,
    '2015-11-28-infopanel-player',
    'Infopanel: Spielerstatus',
    'Das Dummy-Widget wurde durch den Spielerstatus ersetzt, die Infos über Gesamtbevölkerung und Finanzen anzeigt.',
    'Info panel: Player\'s status',
    'The dummy widget was replaced by the player\'s status showing information about total population and finances.',
    '2015-11-28 12:24:52'
), (
    30,
    '2015-11-28-infopanel-public-building',
    'Infopanel: ausgewähltes öffentliches Gebäude',
    'Das Infopanel für öffentliche Gebäude ist komplett fertig.',
    'Info panel: selected public building',
    'The info panel for public buildings is now complete.',
    '2015-11-28 12:18:32'
), (
    29,
    '2015-11-28-infopanel-house',
    'Infopanel: ausgewähltes Haus',
    'Ist ein Haus ausgewählt, so zeigt das Infopanel Informationen über Einwohneranzahl und Bevölkerungsgruppe.',
    'Info panel: selected house',
    'When a house is selected the info panel shows information about population and population tier.',
    '2015-11-28 12:18:14'
), (
    28,
    '2015-09-14-gui-map-controls-graphically-revised',
    'Steuerelemente zum Drehen und Zoomen der Karte',
    'Steuerelemente zum Drehen und Zoomen der Karte hinzugefügt. Minimap grafisch überarbeitet.',
    'Controls to rotate and zoom the map',
    'Added controls to rotate and zoom the map. Minimap graphically revised.',
    '2015-09-14 17:36:31'
), (
    27,
    '2015-08-23-build-menu-revised',
    'Infos im Baumenü überarbeitet',
    'Infos im Baumenü überarbeitet. Dank der GUI-Komponenten haben wir nun Statusleisten-Text für die Baukosten.',
    'Information in the build menu revised',
    'Information in the build menu revised. Thanks to the GUI components we now have statusbar text for the building costs.',
    '2015-08-23 08:59:19'
), (
    26,
    '2015-08-10-refactoring-buildoperation-done',
    'Refactoring "BuildOperation" abgeschlossen',
    'Refactoring "BuildOperation" abgeschlossen. Im Screenshot sieht man, wie sich bestehende und neue Straßenkacheln beim Bau anpassen (Kreuzung über die Pflasterstraße; Pflasterstraße oben wird zum T-Stück).',
    'Refactoring "BuildOperation" finished',
    'Refactoring "BuildOperation" finished. The screenshot shows existing and new street tiles adepting while building (Crossing across the cobbled street; Cobbled street at top becomes a tee piece).',
    '2015-08-10 22:07:37'
), (
    25,
    '2015-07-19-refactoring-buildoperation-dev',
    'Refactoring "BuildOperation": Entwicklungszwischenstand',
    'Refactoring "BuildOperation": Hier ist ein Entwicklungszwischenstand vom Baumodus zu sehen. Die Kollisionerkennung beim Bau funktioniert (wieder).',
    'Refactoring "BuildOperation": preliminary development state',
    'Refactoring "BuildOperation": The build mode can be seen here on a preliminary development state. The collision detection while building works (again).',
    '2015-07-19 08:48:13'
), (
    24,
    '2015-06-28-rendering-elevation-zero',
    'Rendering von Objekten mit Elevation 0',
    'Rendering von Objekten mit Elevation 0 (d.&nbsp;h. sitzen auf dem Wasser, nicht der Insel). Hier ist die Anlegestelle zu sehen.',
    'Rendering of objects with elevation 0',
    'Rendering of objects with elevation 0 (i.&nbsp;e. sitting on top of the water, not the island). Here the pier can been seen.',
    '2015-06-28 20:09:52'
), (
    23,
    '2015-05-14-sugarcane-and-tobacco-plantations',
    'Zuckerrohr- und Tabakplantagen',
    'Zuckerrohr- und Tabakplantagen',
    'Sugarcane and tobacco plantations',
    'Sugarcane and tobacco plantations.',
    '2015-05-14 20:45:25'
), (
    22,
    '2015-05-14-sugarcane-and-tobacco-fields',
    'Zuckerrohr- und Tabakfeld',
    'Zuckerrohr- und Tabakfeld',
    'Sugarcane and tobacco field',
    'Sugarcane and tobacco field.',
    '2015-05-14 20:41:49'
), (
    21,
    '2015-04-13-carriers-behind-buildings',
    'Träger werden nun korrekt hinter Gebäuden gerendert',
    'Träger werden nun korrekt hinter Gebäuden gerendert.',
    'Carriers behind buildings are now rendered correctly',
    'Carriers behind buildings are now rendered correctly.',
    '2015-04-13 15:45:14'
), (
    20,
    '2015-04-13-settlers-houses',
    'Alle Grafiken für die 5 Siedlerhäuser sind fertig',
    'Alle Grafiken für die 5 Siedlerhäuser sind fertig.',
    'All graphics of the 5 settlers\' houses are done',
    'All graphics of the 5 settlers\' houses are done.',
    '2015-04-13 15:37:57'
), (
    19,
    '2015-03-29-building-paths',
    'Bauen von Pfaden',
    'Bauen von Pfaden. Hier erkennt man deutlich, dass sich Straßenkacheln noch nicht anpassen (kein T-Stück).',
    'Building paths',
    'Building paths. Here one recognizes clearly that street tiles do not adept yet (no tee piece).',
    '2015-03-29 00:44:08'
), (
    18,
    '2015-03-29-building-areas',
    'Bauen von Flächen',
    'Bauen von Flächen. Hier sind die Plätze zu sehen.',
    'Building areas',
    'Building areas. Here the squares are to be seen.',
    '2015-03-29 00:43:32'
), (
    17,
    '2015-03-29-forest-around-foresters-house',
    'Waldkacheln um das Forsthaus',
    'Waldkacheln um das Forsthaus, wo man verschiedene Ansichten und Wachstumsstadien des Walds sieht.',
    'Forest tiles around the forester\'s house',
    'Forest tiles around the forester\'s house, where one can see the forest\'s different views and growth states.',
    '2015-03-29 00:25:52'
), (
    16,
    '2015-03-29-first-graphic-of-forest',
    'Erste Grafik für den Wald',
    'Erste Grafik für den Wald.',
    'First graphic of the forest',
    'First graphic of the forest.',
    '2015-03-29 00:25:23'
), (
    15,
    '2015-03-29-farm-road-graphics',
    'Feldweggrafiken sind fertig',
    'Feldweggrafiken sind fertig.',
    'Farm road graphics are finished',
    'Farm road graphics are finished.',
    '2015-03-19 21:13:29'
), (
    14,
    '2015-03-15-hoverobject-no-place',
    '"Hoverobjekt" im Baumodus: kein Platz',
    '"Hoverobjekt" im Baumodus, wenn das zu bauende Gebäude keinen Platz hat.',
    '"Hover object" in build mode: no place',
    '"Hover object" in build mode when the building to be constructed has no place.',
    '2015-03-15 20:42:27'
), (
    13,
    '2015-03-15-building-multiple-buildings-at-once',
    'Mehrere Gebäude können nun auf einmal gebaut werden',
    'Mehrere Gebäude können nun auf einmal gebaut werden.',
    'Multiple buildings can now be built at once',
    'Multiple buildings can now be built at once.',
    '2015-03-15 20:41:30'
), (
    12,
    '2015-02-13-rotation-rendering-dev',
    'Feature "Drehung der Karte": Rendering komplett im Eimer',
    'Screenshot mitten in der Entwicklung des Features "Drehung der Karte". Rendering komplett im Eimer.',
    'Feature "Rotation of the map": Rendering completely screwed',
    'Screenshot in the middle of development of the feature "Rotation of the map". Rendering is completely screwed.',
    '2015-02-13 22:35:52'
), (
    11,
    '2015-01-17-graphics-four-views',
    'Alle Gebäude haben nun Grafiken für die vier Ansichten',
    'Alle Gebäude haben nun Grafiken für die vier Ansichten.',
    'All buildings now have graphics for the four views',
    'All buildings now have graphics for the four views.',
    '2015-01-07 00:11:16'
), (
    10,
    '2015-01-15-rendering-bug',
    'Ein Rendering-Bug ;-)',
    'Ein Rendering-Bug. ;-)',
    'A rendering bug ;-)',
    'A rendering bug. ;-)',
    '2015-01-05 15:51:30'
), (
    9,
    '2014-11-30-settlement-with-all-buildings',
    'Siedlung, die alle Gebäudegrafiken zeigt, die es bis dahin gibt',
    'Siedlung, die alle Gebäudegrafiken zeigt, die es bis dahin gibt.',
    'Settlement showing all building graphics that exist at this time',
    'Settlement showing all building graphics that exist at this time.',
    '2014-11-30 13:51:54'
), (
    8,
    '2014-11-15-pioneers-house-improved',
    'Pionierhäuser-Grafik verbessert',
    'Pionierhäuser-Grafik verbessert.',
    'Graphic of pioneers\' house improved',
    'Graphic of pioneers\' house improved.',
    '2014-11-15 22:24:31'
), (
    7,
    '2014-11-12-evelation-finished-new-coast-graphics',
    'Elevation fertig. Hier mit den neuen Küstengrafiken',
    'Elevation fertig. Hier mit den neuen Küstengrafiken.',
    'Elevation finished. Here with the new coast graphics',
    'Elevation finished. Here with the new coast graphics.',
    '2014-11-12 16:05:11'
), (
    6,
    '2014-11-11-elevation-finished-old-coast-graphics',
    'Elevation fertig. Hier noch die alten Küstengrafiken zu sehen',
    'Elevation fertig. Hier noch die alten Küstengrafiken zu sehen.',
    'Elevation finished. Here still the old coast graphics are to been seen',
    'Elevation finished. Here still the old coast graphics are to been seen.',
    '2014-11-11 23:46:25'
), (
    5,
    '2014-10-28-graphic-of-toolsmiths',
    'Neu: Grafik für Werkzeugschmiede',
    'Neu: Grafik für Werkzeugschmiede.',
    'New: graphic of toolsmith\'s',
    'New: graphic of toolsmith\'s.',
    '2014-10-28 00:03:40'
), (
    4,
    '2014-10-26-pathfinding-algorithm-only-using-streets',
    'Pathfinding-Algorithmus berechnet eine Route, welche nur Straßen nutzt',
    'Pathfinding-Algorithmus berechnet eine Route, welche nur Straßen nutzt.',
    'Pathfinding algorithm calculates a route only using streets',
    'Pathfinding algorithm calculates a route only using streets.',
    '2014-10-26 11:09:48'
), (
    3,
    '2014-10-21-sheep-farms-weaving-mills-new-goods-woll-cloth',
    'Schaffarmen und Webstuben: neue Waren Wolle und Stoff',
    'Schaffarmen und Webstuben mit den beiden neuen Waren Wolle und Stoff.',
    'Sheep farms and weaving mills: new goods woll und cloth',
    'Sheep farms and weaving mills with both new goods woll und cloth.',
    '2014-10-21 23:24:19'
), (
    2,
    '2014-10-18-pathfinding-algorithm-finished',
    'Pathfinding-Algorithmus fertig',
    'Pathfinding-Algorithmus fertig.',
    'Pathfinding algorithm finished',
    'Pathfinding algorithm finished.',
    '2014-10-18 13:14:06'
), (
    1,
    '2014-09-28-java-helper-program-dependencies-rendering-order',
    'Java-Hilfsprogramm: Abhängigkeiten der Rendering-Reihenfolge darstellt',
    'Java-Hilfsprogramm, was die Abhängigkeiten der Rendering-Reihenfolge darstellt.',
    'Java helper program: dependencies in rendering order',
    'Java helper program showing the dependencies in rendering order.',
    '2014-09-28 16:51:31'
);