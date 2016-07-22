<#global title>
    <@translate lang="de">Datenschutz</@translate>
    <@translate lang="en">Privacy</@translate>
</#global>

<#global additionalMetaTags>
    <#assign value>
        <@translate lang="de">
            Ein paar Worte zum Datenschutz. OpenIsles.org respektiert den &quot;Do not Track&quot;-Header.
        </@translate>
        <@translate lang="en">
            A few words about privacy. OpenIsles.org respects the &quot;Do not Track&quot; header.
        </@translate>
    </#assign>
    <meta name="description" value="${value}" />
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <@translate lang="de">
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
                Um dir nicht bei jedem Besuch die Cookie-Warnung anzuzeigen, sondern nur einmalig, wird der lokale
                Web-Storage deines Browser benutzt, um sich zu merken, dass du den Hinweis bereits gesehen hast.
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
        </@translate>
        <@translate lang="en">
            <h1>Privacy</h1>
            <p>
                A few words about privacy while you are browsing this website.
            </p>
            <p>
                OpenIsles.org uses the free analytics tool <a href="http://piwik.org">Piwik</a> to generate
                statistics of the website's usage. The collected data will not be disclosed to third parties.
                In these statistics you strictly show up anonymously because your IP address will be masked
                to protect your privacy.

                <br />

                OpenIsles.org respects the
                <a href="https://en.wikipedia.org/wiki/Do_Not_Track">"Do not Track" header</a>!
                If you want to disagree on evaluating and storing of this statistic data according to
                §&nbsp;15 Abs.&nbsp;3 TMG, simply activate the corresponding setting in your web browser.
            </p>
            <p>
                So as not to show you the cookie warning on every visit, but once only, your browser's local
                storage is used to remember that you already have seen the hint.
            </p>
            <p>
                For further statistics OpenIsles.org uses the webserver's log files in which all requests to the
                website are logged. These contain who (IP address) did request what (requested URL), when (date and
                time), as well as the Useragent and Referrer headers if your web browser sends them.
            </p>
            <p>
                Here are no hidden scripts from Facebook or Google, collecting data and chasing you across
                the internet! :-)
            </p>
        </@translate>
    </div>
</div>
</@layout.page>