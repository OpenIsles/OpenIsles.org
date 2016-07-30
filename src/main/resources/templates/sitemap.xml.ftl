<#ftl output_format="XML" />
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">

    <url>
        <loc>http://${siteLanguage}.${baseHost}/</loc>
    </url>

    <url>
        <loc>http://${siteLanguage}.${baseHost}/faq.html</loc>
    </url>

    <url>
        <loc>http://${siteLanguage}.${baseHost}/media/screenshots.html</loc>
    </url>
    <#list screenshots as screenshot>
        <url>
            <loc>http://${siteLanguage}.${baseHost}/media/screenshots/${screenshot.urlName}.html</loc>
            <image:image>
                <image:loc>http://${staticHostName}/media/screenshots/${screenshot.urlName}.png</image:loc>
                <image:caption>${screenshot.title[siteLanguage]}</image:caption>
            </image:image>
        </url>
    </#list>

    <url>
        <loc>http://${siteLanguage}.${baseHost}/media/videos.html</loc>
    </url>

    <url>
        <loc>http://${siteLanguage}.${baseHost}/game-infos/goods.html</loc>
    </url>

    <url>
        <loc>http://${siteLanguage}.${baseHost}/game-infos/buildings.html</loc>
    </url>
    <#list buildings as building>
        <url>
            <loc>http://${siteLanguage}.${baseHost}/game-infos/buildings/${building.name}.html</loc>
        </url>
    </#list>

    <url>
        <loc>http://${siteLanguage}.${baseHost}/game-infos/inhabitants.html</loc>
    </url>
    <url>
        <loc>http://${siteLanguage}.${baseHost}/game-infos/ships.html</loc>
    </url>

    <url>
        <loc>http://${siteLanguage}.${baseHost}/contact.html</loc>
    </url>

    <url>
        <loc>http://${siteLanguage}.${baseHost}/privacy.html</loc>
    </url>
</urlset>