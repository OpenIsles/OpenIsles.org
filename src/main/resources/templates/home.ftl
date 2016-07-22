<#global additionalMetaTags>
    <#assign value>
        <@translate lang="de">
            Willkommen auf OpenIsles! OpenIsles ist ein freies Insel-Aufbauspiel,
            was sich maßgeblich an dem Klassiker Anno&nbsp;1602 orientiert.
        </@translate>
        <@translate lang="en">
            Welcome to OpenIsles! OpenIsles is a free island-building game which significantly orientates
            itself by the classic Anno&nbsp;1602.
        </@translate>
    </#assign>
    <meta name="description" value="${value}" />
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <@translate lang="de">
            <h1>Willkommen auf OpenIsles!</h1>
            <p>
                Mit einem kleinen Schiff und etwas Baumaterial findest du dich inmitten einer idyllischen Inselwelt.
                Nun heißt es Inseln erkunden, Siedlungen errichten und deren Einwohner mit Gütern und öffentlichen
                Gebäuden zu versorgen.
            </p>
        </@translate>
        <@translate lang="en">
            <h1>Welcome to OpenIsles!</h1>
            <p>
                With a small ship and a little building material you find yourself in an idyllic island world.
                Now it's islands to explore, build settlements and supply its inhabitants with goods and public
                buildings.
            </p>
        </@translate>

        <hr />

        <@translate lang="de">
            <p>
                OpenIsles ist ein freies Insel-Aufbauspiel, was sich maßgeblich an dem Klassiker Anno&nbsp;1602
                orientiert.<br />
                Das Hauptziel dieses Projekt ist es, einerseits das Spiel als Nachbau für die Linux-Community zur
                Verfügung zu stellen und gleichzeitig die Möglichkeit zu schaffen, alle Faktoren des Spiels
                umzukonfigurieren und beliebig zu erweitern.
            </p>
            <p>
                Ich hab viel Wert auf Detailtreue gelegt, sowohl bei den Grafiken, als auch bei der Spielmechanik.
                Gleichzeitig sind aber auch diverse Sachen aus dem Klassiker verbessert worden.
            </p>
            <p>
                Aktuell befindet sich das Spiel in einer sehr frühen Entwicklungsphase. Viele Features sind noch nicht
                oder nicht vollständig implementiert. Du kannst dir OpenIsles aber bereits aus dem GitHub-Repository
                herunterladen und ausprobieren.
            </p>
        </@translate>
        <@translate lang="en">
            <p>
                OpenIsles is a free island-building game which significantly orientates itself by the classic
                Anno&nbsp;1602.<br />
                This project's mail goal is one the hand to provide that game as a remake to the Linux community
                while creating the possibility for reconfiguring and expanding all factors of the game.
            </p>
            <p>
                I have put a lot of afford on attention to detail, both with the graphics as well as in the game
                mechanics. At the same time various things from the classic have been improved.
            </p>
            <p>
                Currently the game is in a very early stage of development. Many features are not yet or not fully
                implemented. But you can already download OpenIsles from GitHub repository and try it.
            </p>
        </@translate>
    </div>
</div>
</@layout.page>