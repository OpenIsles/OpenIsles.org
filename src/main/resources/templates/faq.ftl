<#global title>
    <@translate lang="de">FAQ – häufig gestellte Fragen</@translate>
    <@translate lang="en">FAQ – frequently asked questions</@translate>
</#global>

<#global additionalMetaTags>
    <#assign value>
        <@translate lang="de">
            FAQ – häufig gestellte Fragen: Hey, das kenn ich! Das is doch Anno&nbsp;1602. Ist das Spiel gratis?
        </@translate>
        <@translate lang="en">
            FAQ – frequently asked questions: Hey, I know that! That's Anno&nbsp;1602. Is the game freeware?
        </@translate>
    </#assign>
    <meta name="description" value="${value}" />
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <h1>
            <@translate lang="de">FAQ – häufig gestellte Fragen</@translate>
            <@translate lang="en">FAQ – frequently asked questions</@translate>
        </h1>

        <dl>
            <dt>
                <@translate lang="de">Hey, das kenn ich! Das is doch Anno&nbsp;1602.</@translate>
                <@translate lang="en">Hey, I know that! That's Anno&nbsp;1602.</@translate>
            </dt>
            <dd>
                <@translate lang="de">
                    Ne, aber ich versuch, dass es so aussieht wie Anno&nbsp;1602. Grafiken und Spielmechanik sollen wie
                    der Klassiker sein. Viele Details wurden eins zu eins nachgebaut. Es gibt aber auch Beispiele,
                    wo ich Verbesserungen gemacht hab, z.&nbsp;B. sind die Grafiken aller Gebäude in allen Richtungen
                    verfügbar.
                </@translate>
                <@translate lang="en">
                    No, but I try so it looks like Anno&nbsp;1602. The graphics und game mechanics should be like
                    the classic. Many details were mimicked one-to-one. But there are also examples where I made
                    improvements, such as all buildings' graphics are available for all views.
                </@translate>
            </dd>

            <dt>
                <@translate lang="de">Ist das Spiel gratis?</@translate>
                <@translate lang="en">Is the game freeware?</@translate>
            </dt>
            <dd>
                <@translate lang="de">
                    Besser. OpenIsles ist freie Software! D.&nbsp;h. die Software ist nicht nur gratis, sondern gibt
                    dir auch die Freiheit, sie beliebig zu verbessern und die Möglichkeit, an ihr mitzuarbeiten.
                </@translate>
                <@translate lang="en">
                    Even better. OpenIsles is free software! I.&nbsp;e. the software does not only costs nothing,
                    but rather gives you the freedom to improve it as you wish and the opportunity to contribute.
                </@translate>
            </dd>

            <dt>
                <@translate lang="de">Wie kann ich spielen?</@translate>
                <@translate lang="en">How can I play?</@translate>
            </dt>
            <dd>
                <@translate lang="de">
                    Aktuell ist das Spiel noch in einer sehr frühen Entwicklungsphase. Es gibt noch keinen Build,
                    den du einfach runterladen und damit loslegen kannst. Wenn du neugierig bist, kannst du den Code
                    aus dem GitHub-Repository herunterladen und selber kompilieren.
                </@translate>
                <@translate lang="en">
                    Currently the game is in a very early stage of development. There is not yet a build you can
                    simply download and get going with. If you are curious, you can download the source code from
                    the GitHub repository and compile it yourself.
                </@translate>
            </dd>

            <dt>
                <@translate lang="de">Was brauche ich, um das Spiel zu kompilieren?</@translate>
                <@translate lang="en">What do I need to compile the game?</@translate>
            </dt>
            <dd>
                <@translate lang="de">Für das Kompilieren benötigst du</@translate>
                <@translate lang="en">For compiling you'll need</@translate>
                <ul>
                    <li>GCC</li>
                    <li>CMake (2.8.12+)</li>
                    <li>
                        <@translate lang="de">
                            PHP (für das Script, dass die Übersetzungsdateien generiert)
                        </@translate>
                        <@translate lang="en">
                            PHP (for the script generating the translation files)
                        </@translate>
                    </li>
                    <li>
                        <@translate lang="de">sowie die benötigen Libraries</@translate>
                        <@translate lang="en">as well as the necessary libraries</@translate>
                        <ul>
                            <li>gettext</li>
                            <li>libSDL2</li>
                            <li>libSDL2-image</li>
                            <li>libSDL2-mixer</li>
                            <li>libSDL2-ttf</li>
                            <@translate lang="de">
                                <li>Google Test (optional, wenn du Tests laufen lassen willst)</li>
                                <li>Doxygen (optional, wenn du die Dokumentation generieren lassen willst)</li>
                            </@translate>
                            <@translate lang="en">
                                <li>Google Test (optional, if you want to run the tests)</li>
                                <li>Doxygen (optional, if you want to generate the documentation)</li>
                            </@translate>
                        </ul>
                    </li>
                    <@translate lang="de">
                        <li>Blender (optional, wenn du die Grafiken verändern willst)</li>
                    </@translate>
                    <@translate lang="en">
                        <li>Blender (optional, if you want to modify the graphics)</li>
                    </@translate>
                </ul>
            </dd>

            <dt>
                <@translate lang="de">Was kann ich tun, wenn ich einen Bug gefunden hab?</@translate>
                <@translate lang="en">What can I do when I've found a bug?</@translate>
            </dt>
            <dd>
                <@translate lang="de">
                    Es ist sehr wahrscheinlich, dass du über Bugs stolperst oder Funktionen, die noch nicht ganz
                    fertig sind. Viele kenn ich bereits. Es gibt aber sicher auch welche, die ich nicht kenn.
                    Leg im GitHub einen Bug-Report an und lass mich wissen, was du gefunden hast.
                </@translate>
                <@translate lang="en">
                    It's very likely you'll encounter bugs or features that are not yet fully finished. At lot
                    of these I know already. But surely there are those I do not know. In GitHub open an issue
                    and let me know what you've found.
                </@translate>
            </dd>

            <dt>
                <@translate lang="de">Ich habe Windows. Kann ich OpenIsles trotzdem nutzen?</@translate>
                <@translate lang="en">I have Windows. Can I use OpenIsles despite?</@translate></dt>
            <dd>
                <@translate lang="de">
                    Ha Ha! Grundsätzlich ist OpenIsles für Linux entwickelt. Die verwendeten Tools und Libraries sind
                    aber plattformübergreifend auch für Windows verfügbar. In der Datei
                    <code>/doc/windows-build/HOWTO.txt</code> befindet sich eine Anleitung, wie du OpenIsles unter
                    Windows&nbsp;7 mit CLion zum Ausführen kriegst. Sicher geht es auch von Hand ohne die IDE.
                </@translate>
                <@translate lang="en">
                    Ha Ha! Essentially OpenIsles is built for Linux. But the used tools and libraries are
                    cross-plattform and also available for Windows. The file <code>/doc/windows-build/HOWTO.txt</code>
                    contains instructions to get OpenIsles running with CLion and Windows&nbsp;7. Certainly it
                    will work manually without the IDE.
                </@translate>
            </dd>
        </dl>
    </div>
</div>
</@layout.page>