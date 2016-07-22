<#global title>
    <@translate lang="de">Screenshots</@translate>
    <@translate lang="en">Screenshots</@translate>
</#global>

<#global additionalMetaTags>
    <#assign value>
        <@translate lang="de">Impressionen vom Spiel und der Entwicklung, chronologisch sortiert</@translate>
        <@translate lang="en">Impressions from the game and development, ordered chronologically</@translate>
    </#assign>
    <meta name="description" value="${value}" />
</#global>

<@layout.page>
<div class="row">
    <div class="small-12 columns">
        <@translate lang="de">
            <h1>Screenshots</h1>
            <p>
                Impressionen vom Spiel und der Entwicklung, chronologisch sortiert. Die neuesten Screenshots sind oben.
                <br />
                Klick die Thumbnails an, um die Screenshots vergrößert und mit Beschreibung anzuzeigen.
            </p>
        </@translate>
        <@translate lang="en">
            <h1>Screenshots</h1>
            <p>
                Impressions from the game and development, ordered chronologically. The most recent screenshots
                are at the top.
                <br />
                Click on the thumbnails to display the screenshots enlarged and with description.
            </p>
        </@translate>

        <div class="card-group">
            <#list screenshots as screenshot>
                <div class="card text-xs-center">
                    <div class="card-block">
                        <a href="/media/screenshots/${screenshot.urlName}.html">
                            <img class="card-img-top"
                                 src="//${staticHostName}/media/screenshots/thumbnails/${screenshot.urlName}.thumb.png"
                                 title="${screenshot.title[siteLanguage]}" alt="${screenshot.description[siteLanguage]}" />
                        </a>
                        <p class="card-text">
                            <small>
                            ${screenshot.createdDate?date?string.long}
                            </small>
                        </p>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</div>
</@layout.page>