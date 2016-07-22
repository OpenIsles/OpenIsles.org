<#global title>
    ${screenshot.title[siteLanguage]} –
    <@translate lang="de">Screenshot</@translate>
    <@translate lang="en">Screenshot</@translate>
</#global>

<#global additionalMetaTags>
    <#assign value>
        <@translate lang="de">Screenshot: </@translate>
        <@translate lang="en">Screenshot: </@translate>
        ${screenshot.description[siteLanguage]}
    </#assign>
    <meta name="description" value="${value}" />
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <h1>
            <@translate lang="de">Screenshot</@translate>
            <@translate lang="en">Screenshot</@translate>
        </h1>
    </div>
</div>

<div class="row">
    <div class="col-xs-12">
        <div class="pull-xs-left">
            <a href="/media/screenshots/${prevScreenshot.urlName}.html">
                <span class="hidden-sm-down">
                    <@translate lang="de">◀&nbsp;vorheriger</@translate>
                    <@translate lang="en">◀&nbsp;previous</@translate>
                </span>
                <span class="hidden-md-up">◀</span>
            </a>
        </div>
        <div class="pull-xs-right">
            <a href="/media/screenshots/${nextScreenshot.urlName}.html">
                <span class="hidden-sm-down">
                    <@translate lang="de">nächster&nbsp;▶</@translate>
                    <@translate lang="en">next&nbsp;▶</@translate>
                </span>
                <span class="hidden-md-up">▶</span>
            </a>
        </div>
        <div class="text-xs-center">
            <h2 class="small-header">${screenshot.title[siteLanguage]}</h2>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xs-12">
        <figure class="figure text-xs-center">
            <a href="/media/screenshots/${nextScreenshot.urlName}.html">
                <img class="img-fluid" src="//${staticHostName}/media/screenshots/${screenshot.urlName}.png"
                     title="${screenshot.title[siteLanguage]}" alt="${screenshot.description[siteLanguage]}" />
            </a>

            <br />
            <a href="//${staticHostName}/media/screenshots/${screenshot.urlName}.png" target="_blank">
                <@translate lang="de">(Bild im neuen Tab öffnen)</@translate>
                <@translate lang="en">(Open picture in new tab)</@translate>
            </a>

            <figcaption class="text-xs-center p-t-1">
                ${screenshot.description[siteLanguage]}
                <br />

                <span class="media-date">
                    ${screenshot.createdDate?date?string.long}
                </span>
            </figcaption>
        </figure>
    </div>
</div>
</@layout.page>