{extends "page-layout.tpl"}

{block "title"}Datenschutz{/block}

{block "additionalMetaTags"}
	<meta name="description"
		  value="Ein paar Worte zum Datenschutz. OpenIsles.org respektiert den &quot;Do not Track&quot;-Header" />
{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<h1>Datenschutz</h1>
		<p>
			Ein paar Worte zum Datenschutz, während du diese Seite betrachtest.
		</p>
		<p>
			OpenIsles.org verwendet das freie Analyse-Tool <a href="http://piwik.org">Piwik</a>, um Statistiken
			zur Webseitennutzung zu generieren. Die gesammelten Daten werden nicht an Dritte weitergegeben.
			Du tauchst in diesen Statistiken grundsätzlich nur anonymisiert auf, weil deine IP-Adresse zum Schutz
			deiner Privatsphäre gekürzt wird.

			<br />

			OpenIsles.org respektiert den
			<a href="https://de.wikipedia.org/wiki/Do_Not_Track_(Software)">"Do not Track"-Header</a>!
			Wenn du gemäß §&nbsp;15 Abs.&nbsp;3 TMG der Auswertung und Speicherung dieser statischen Daten
			widersprechen möchtest, so aktiviere einfach die entsprechende Einstellung in deinem Browser.
		</p>
		<p>
			Für weitere Statistiken verwendet OpenIsles.org die Logdateien des Webservers, in welchen alle Zugriffe
			auf die Webseite protokolliert werden. Hierin enthalten sind wer (IP-Adresse) wann (Datum und Uhrzeit)
			was (angefragte URL) aufgerufen hat, sowie der Useragent- und Referrer-Header, so sie dein Browser
			übermittelt.
		</p>
		<p>
			Hier gibt es keine versteckten Facebook- oder Google-Scripts, die Daten sammeln und dich quer durch das
			Internet verfolgen! :-)
		</p>
	</div>
</div>
{/block}