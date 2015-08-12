<div class="row">
	<div class="small-12 small-centered columns">
		<h1>FAQ – häufig gestellte Fragen</h1>
		<dl>
			<dt>Hey, das kenn ich! Das is doch Anno&nbsp;1602.</dt>
			<dd>
				Ne, aber ich versuch, dass es so aussieht wie Anno&nbsp;1602. Grafiken und Spielmechanik sollen wie
				der Klassiker sein. Viele Details wurden eins zu eins nachgebaut. Es gibt aber auch Beispiele,
				wo ich Verbesserungen gemacht hab, z.&nbsp;B. sind die Grafiken aller Gebäude in allen Richtungen
				verfügbar.
			</dd>

			<dt>Wie kann ich spielen?</dt>
			<dd>
				Aktuell ist das Spiel noch in einer sehr frühen Entwicklungsphase. Es gibt noch keinen Build,
				den du einfach runterladen und damit loslegen kannst. Wenn du neugierig bist, kannst du den Code
				aus dem GitHub-Repository herunterladen und selber kompilieren.
			</dd>

			<dt>Was brauche ich, um das Spiel zu kompilieren?</dt>
			<dd>
				Für das Kompilieren benötigst du
				<ul>
					<li>GCC</li>
					<li>CMake (2.8.12 oder höher)</li>
					<li>
						sowie die benötigen Libraries
						<ul>
							<li>libSDL2</li>
							<li>libSDL2-image</li>
							<li>libSDL2-mixer</li>
							<li>libSDL2-ttf</li>
							<li>Google Test (optional, wenn du Tests laufen lassen willst)</li>
							<li>Doxygen (optional, wenn du die Dokumentation generieren lassen willst)</li>
						</ul>
					</li>
					<li>Blender (optional, wenn du die Grafiken verändern willst)</li>
				</ul>
			</dd>

			<dt>Was kann ich tun, wenn ich einen Bug gefunden hab?</dt>
			<dd>
				Es ist sehr wahrscheinlich, dass du über Bugs stolperst oder Funktionen, die noch nicht ganz
				fertig sind. Viele kenn ich bereits. Es gibt aber sicher auch welche, die ich nicht kenn.
				Leg im GitHub einen Bug-Report an und lass mich wissen, was du gefunden hast.
			</dd>

			<dt>Ich habe Windows. Kann ich OpenIsles trotzdem nutzen?</dt>
			<dd>
				Ha Ha! Grundsätzlich ist OpenIsles für Linux entwickelt. Die verwendeten Tools und Libraries sind
				aber plattformübergreifend auch für Windows verfügbar. In der Datei
				<code>/doc/windows-build/HOWTO.txt</code> befindet sich eine Anleitung, wie du OpenIsles unter
				Windows&nbsp;7 mit CLion zum Ausführen kriegst. Sicher geht es auch von Hand ohne die IDE.
			</dd>
		</dl>
	</div>
</div>