<#macro page>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <meta name="author" content="Alexander Münch" />
        <#assign copyright = "Copyright © 2015-${year}">
        <meta name="copyright" content="${copyright} Alexander Münch" />

        <#if additionalMetaTags??>
            ${additionalMetaTags}
        </#if>

        <meta name="robots" content="index, follow" />
        <meta name="language" content="${siteLanguage}" />

        <#list languageMap?keys as lang>
            <link rel="alternate" hreflang="${lang}" href="${alternateUrls[lang]}" />
        </#list>

        <title>
            <#if title??>
                ${title} – OpenIsles
            <#else>
                <@translate lang="de">OpenIsles – das freie Insel-Aufbauspiel</@translate>
                <@translate lang="en">OpenIsles – the free island-building game</@translate>
            </#if>
        </title>

        <script type="application/ld+json">
            {
                "@context": "http://schema.org",
                "@type": "WebSite",
                "name": "OpenIsles",
                "alternateName": "OpenIsles.org",
                "url": "http://www.openisles.org"
            }
        </script>

        <style type="text/css">
            @import "//${staticHostName}/css/app.css";
        </style>

        <script type="text/javascript" src="//${staticHostName}/js/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="//${staticHostName}/js/bootstrap/bootstrap.min.js"></script>
    </head>

    <body lang="${siteLanguage}">
        <header id="site-header">
            <div class="container text-xs-center hidden-sm-down">
                <h1><span class="open">Open</span><span class="isles">Isles</span></h1>
                <h2>
                    <@translate lang="de">das freie Insel-Aufbauspiel</@translate>
                    <@translate lang="en">the free island-building game</@translate>
                </h2>
            </div>
            <div class="container text-xs-center hidden-md-up">
                <h1><span class="open">Open</span><span class="isles">Isles</span></h1>
                <h2>
                    <@translate lang="de">das freie Insel-Aufbauspiel</@translate>
                    <@translate lang="en">the free island-building game</@translate>
                </h2>
            </div>
            <#if isLocalDevelopment>
                <div class="container text-xs-center" style="color: red; font-size: 30px; font-weight: bold;">
                    – lokale Entwicklung –
                </div>
            </#if>
        </header>

        <nav class="navbar navbar-dark">
            <div class="container">
                <h1><a class="navbar-brand" href="/">OpenIsles</a></h1>

                <ul class="nav navbar-nav">
                    <li class="nav-item<#if navActive('/')> active</#if>">
                        <a class="nav-link" href="/">${i18n("nav./")}</a>
                    </li>
                    <li class="nav-item<#if navActive('/faq.html')> active</#if>">
                        <a class="nav-link" href="/faq.html">${i18n("nav./faq.html")}</a>
                    </li>
                    <li class="nav-item dropdown<#if navActive('/media.html')> active</#if>">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">${i18n("nav./media.html")}</a>
                        <ul class="dropdown-menu">
                            <li<#if navActive('/media/screenshots.html')> class="active"</#if>>
                                <a class="dropdown-item" href="/media/screenshots.html">${i18n("nav./media/screenshots.html")}</a>
                            </li>
                            <li<#if navActive('/media/videos.html')> class="active"</#if>>
                                <a class="dropdown-item" href="/media/videos.html">${i18n("nav./media/videos.html")}</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown<#if navActive('/game-infos.html')> active</#if>">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">${i18n("nav./game-infos.html")}</a>
                        <ul class="dropdown-menu">
                            <li<#if navActive('/game-infos/goods.html')> class="active"</#if>>
                                <a class="dropdown-item" href="/game-infos/goods.html">${i18n("nav./game-infos/goods.html")}</a>
                            </li>
                            <li<#if navActive('/game-infos/buildings.html')> class="active"</#if>>
                                <a class="dropdown-item" href="/game-infos/buildings.html">${i18n("nav./game-infos/buildings.html")}</a>
                            </li>
                            <li<#if navActive('/game-infos/inhabitants.html')> class="active"</#if>>
                                <a class="dropdown-item" href="/game-infos/inhabitants.html">${i18n("nav./game-infos/inhabitants.html")}</a>
                            </li>
                            <li<#if navActive('/game-infos/ships.html')> class="active"</#if>>
                                <a class="dropdown-item" href="/game-infos/ships.html">${i18n("nav./game-infos/ships.html")}</a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <div class="pull-xs-right">
                    <a id="cookie-warning-button" href="/privacy.html">
                        <@translate lang="de">
                            <img src="//${staticHostName}/img/cookie.svg"
                                 style="width: 24px; height: 24px;" alt="Cookie-Warnung!"
                                 title="Diese Seite verwendet Cookies. Klick hier für mehr Infos." />
                        </@translate>
                        <@translate lang="en">
                            <img src="//${staticHostName}/img/cookie.svg"
                                 style="width: 24px; height: 24px;" alt="Cookie warning!"
                                 title="This website uses cookies. Click here for more information." />
                        </@translate>
                    </a>
                    <#--&nbsp;
                    <a class="btn btn-danger btn-sm" href="https://github.com/OpenIsles/OpenIsles/archive/master.zip"
                       target="_blank" rel="nofollow">
                        <strong>Download</strong>
                    </a>-->
                    &nbsp;
                    <a class="btn btn-success btn-sm" href="https://github.com/OpenIsles/"
                       target="_blank" rel="nofollow">
                        <img src="//${staticHostName}/img/github-white.png" alt="GitHub"
                             style="vertical-align: baseline; width: 12px; height: 12px;"/>
                        GitHub
                    </a>
                    <span style="padding-right: 10px;">&nbsp;</span>
                    <#list languageMap?keys as lang>
                        <#assign langName = languageMap[lang]>
                        <#assign alternateUrl = alternateUrls[lang]>
                        <#lt><a href="${alternateUrl}" class="btn lang<#if lang == siteLanguage> selected</#if>">
                            <img src="//${staticHostName}/img/flags/${lang}.png"
                                 alt="${langName}" title="${langName}" />
                        </a><#rt>
                    </#list>
                </div>
            </div>
        </nav>

        <section id="page-wrapper">
            <#if breadcrumb??>
                <nav>
                    <div class="container">
                        <ol class="breadcrumb">
                            <#list breadcrumb as breadcrumbBit>
                                <#if !breadcrumbBit?has_next>
                                    <li class="breadcrumb-item active">${breadcrumbBit.title}</li>
                                <#elseif breadcrumbBit.clickable>
                                    <li class="breadcrumb-item">
                                        <a href="${breadcrumbBit.url}">${breadcrumbBit.title}</a>
                                    </li>
                                <#else>
                                    <li class="breadcrumb-item disabled">${breadcrumbBit.title}</li>
                                </#if>
                            </#list>
                        </ol>
                    </div>
                    <script type="application/ld+json">
                    {
                        "@context": "http://schema.org",
                        "@type": "BreadcrumbList",
                        "itemListElement":
                        [
                        <#list breadcrumb as breadcrumbBit>
                            {
                                "@type": "ListItem",
                                "position": ${breadcrumbBit?counter},
                                "item":
                                {
                                <#if !breadcrumbBit?has_next ||  breadcrumbBit.clickable>
                                    "@id": "${breadcrumbBit.url}",
                                </#if>
                                    "name": "${breadcrumbBit.title}"
                                }
                            }<#sep>,</#sep>
                        </#list>
                        ]
                    }
                    </script>
                </nav>
            </#if>

            <div class="container">
                <#nested />
            </div>
        </section>

        <footer id="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-xs-center col-md-4 text-md-left">
                        OpenIsles – ${copyright}
                        <br class="hidden-md-up" />Alexander Münch
                        <br />powered by <a href="http://thehacker.biz" target="_blank" rel="nofollow">theHacker</a>
                    </div>

                    <div class="col-xs-12 text-xs-center col-md-4">
                        <br class="hidden-md-up" />
                        <a href="/contact.html">${i18n("nav./contact.html")}</a> |
                        <a href="/privacy.html">${i18n("nav./privacy.html")}</a>
                    </div>

                    <div class="col-xs-12 text-xs-center col-md-4 col-md-right">
                        <br class="hidden-md-up" />
                        <a href="http://www.w3.org/html/logo/" target="_blank" rel="nofollow">
                            <img src="//${staticHostName}/img/html5-badge-h-css3-multimedia-semantics-storage.png"
                                 width="197" height="64"
                                 alt="HTML5 Powered with CSS3 / Styling, Multimedia, Semantics, and Offline &amp; Storage"
                                 title="HTML5 Powered with CSS3 / Styling, Multimedia, Semantics, and Offline &amp; Storage" />
                        </a>
                    </div>
                </div>
            </div>
        </footer>

        <#if !isSearchCrawler>
            <@cookieWarning />
        </#if>

        <#assign piwikIdSite = isLocalDevelopment?then(3, 1)>
        <script type="text/javascript">
            var _paq = _paq || [];
            _paq.push(['setCustomVariable', 1, 'siteLanguage', '${siteLanguage}', 'page']);
            _paq.push(['trackPageView']);
            _paq.push(['enableLinkTracking']);
            (function() {
                var u = "//piwik.thehacker.biz/";
                _paq.push(['setTrackerUrl', u + 'piwik.php']);
                _paq.push(['setSiteId', ${piwikIdSite}]);
                var d = document, g = d.createElement('script'), s = d.getElementsByTagName('script')[0];
                g.type = 'text/javascript';
                g.async = true;
                g.defer = true;
                g.src = u + 'piwik.js';
                s.parentNode.insertBefore(g, s);
            })();
        </script>
        <noscript><img src="//piwik.thehacker.biz/piwik.php?idsite=${piwikIdSite}" alt="" /></noscript>
    </body>
</html>
</#macro>

<#macro cookieWarning>
<script type="text/javascript" src="//${staticHostName}/js/jquery/jquery-ui.min.js"></script>

<div id="cookie-warning" class="modal">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-md-4">
                            <img src="//${staticHostName}/img/cookie.svg" alt="" />
                        </div>
                        <div class="col-xs-12 col-md-8">
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">×</span>
                            </button>

                            <@translate lang="de">
                                <h1>Cookie-Warnung</h1>
                                <p>
                                    Sorry für die Störung :-(<br />
                                    Dank eines neuen idiotischen Gesetzes muss jede Webseite ihre Besucher über die
                                    Verwendung einer Technologie aufklären, die seit nunmehr über 20 Jahren im Einsatz ist:
                                    <b>Cookies</b>
                                </p>
                                <p>
                                    Wie jede Webseite, verwendet auch OpenIsles.org Cookies. Im Gegensatz zu anderen
                                    Seiten verwenden wir diese aber nur zu statistischen Zwecken. Hier gibt es keine
                                    versteckten Facebook- oder Google-Scripts, die Daten sammeln und dich quer durch
                                    das Internet verfolgen! :-)
                                </p>
                                <p>
                                    Sofern du den lokalen Web-Storage deines Browsers nicht blockierst, wird dir diese
                                    Meldung nur einmalig gezeigt.
                                </p>
                                <p>
                                    <a href="/privacy.html">Klick hier für weitere Informationen zum Datenschutz.</a>
                                </p>
                            </@translate>
                            <@translate lang="en">
                                <h1>Cookie warning</h1>
                                <p>
                                    Sorry for the disturbance :-(<br />
                                    Thanks to a new idiotic law every website must enlighten its visitors about the usage
                                    of a technology which is in use for more than 20 years:
                                    <b>Cookies</b>
                                </p>
                                <p>
                                    Like every website OpenIsles.org uses cookies, too. In contrast to other websites
                                    we only use these for statistical purposes. Here are no hidden scripts from Facebook
                                    or Google, collecting data and chasing you across the internet! :-)
                                </p>
                                <p>
                                    Provided you do not block your browser's local storage this message will be shown
                                    to you only once.
                                </p>
                                <p>
                                    <a href="/privacy.html">Click here for more information about privacy.</a>
                                </p>
                            </@translate>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="//${staticHostName}/js/cookie-warning.js"></script>
</#macro>