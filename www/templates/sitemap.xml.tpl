<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">

    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/</loc>
    </url>

    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/faq.html</loc>
    </url>

    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/media.html</loc>
    </url>

    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/media/screenshots.html</loc>
    </url>
    {foreach $screenshots as $screenshot}
        <url>
            <loc>http://{$siteLanguage}.{$targetHostName}/media/screenshots/{$screenshot.url_name}.html</loc>
            <image:image>
                <image:loc>http://{$staticHostName}/media/screenshots/{$screenshot.url_name}.png</image:loc>
                <image:caption>{$screenshot.title|escape}</image:caption>
            </image:image>
        </url>
    {/foreach}

    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/media/videos.html</loc>
    </url>

    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/game-infos.html</loc>
    </url>
    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/game-infos/goods.html</loc>
    </url>
    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/game-infos/buildings.html</loc>
    </url>
    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/game-infos/inhabitants.html</loc>
    </url>
    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/game-infos/ships.html</loc>
    </url>

    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/contact.html</loc>
    </url>

    <url>
        <loc>http://{$siteLanguage}.{$targetHostName}/privacy.html</loc>
    </url>
</urlset>