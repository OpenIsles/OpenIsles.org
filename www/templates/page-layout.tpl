<!DOCTYPE html>
<html lang="de">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>{if isset($title)}{$title|escape} – OpenIsles{else}OpenIsles – das freie Insel-Aufbauspiel{/if}</title>

        <link rel="stylesheet" href="/css/normalize.css" />
        <link rel="stylesheet" href="/css/foundation.min.css" />
        <link rel="stylesheet" href="/css/openisles.css" />

        <script src="/js/vendor/modernizr.js"></script>
    </head>

    <body>
        <header id="site-header">
            <div class="row text-center show-for-medium-up">
                <h1><span class="open">Open</span><span class="isles">Isles</span></h1>
                <h2>das freie Insel-Aufbauspiel</h2>
            </div>
            <div class="row text-center show-for-small-only">
                <h1><span class="open">Open</span><span class="isles">Isles</span></h1>
                <h2>das freie Insel-Aufbauspiel</h2>
            </div>
        </header>

        <div class="contain-to-grid sticky">
            <nav class="top-bar" data-topbar role="navigation">
                <ul class="title-area">
                    <li class="name">
                        <h1><a href="/">OpenIsles</a></h1>
                    </li>
                    <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
                </ul>

                <section class="top-bar-section">
                    <ul class="left">
                        <li{if isset($navsActive['home'])} class="active"{/if}>
                            <a href="/">Home</a>
                        </li>
                        <li{if isset($navsActive['faq'])} class="active"{/if}>
                            <a href="/faq.html">FAQ</a>
                        </li>
                        <li{if isset($navsActive['screenshots'])} class="active"{/if}>
                            <a href="/screenshots.html">Screenshots</a>
                        </li>
                        <li class="has-dropdown{if isset($navsActive['game-infos'])} active{/if}">
                            <a href="/game-infos.html">Spielinfos</a>
                            <ul class="dropdown">
                                <li{if isset($navsActive['game-infos/goods'])} class="active"{/if}>
                                    <a href="/game-infos/goods.html">Waren</a>
                                </li>
                                <li{if isset($navsActive['game-infos/buildings'])} class="active"{/if}>
                                    <a href="/game-infos/buildings.html">Gebäude</a>
                                </li>
                                <li{if isset($navsActive['game-infos/population'])} class="active"{/if}>
                                    <a href="/game-infos/population.html">Einwohner</a>
                                </li>
                                <li{if isset($navsActive['game-infos/ships'])} class="active"{/if}>
                                    <a href="/game-infos/ships.html">Schiffe</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="right">
                        <li><a href="/download.html" class="alert button"><strong>Download</strong></a></li>
                        <li>&nbsp;</li>
                        <li>
                            <a href="/github.html" class="success button">
                                <img src="/img/github-white.png" alt="GitHub"
                                     style="vertical-align: baseline; width: 12px; height: 12px;"/>
                                GitHub
                            </a>
                        </li>
                    </ul>
                </section>

            </nav>
        </div>

        <section id="page-wrapper">
            {$pageContent}
        </section>

        <footer id="site-footer">
            <div class="row">
                <div class="small-12 small-centered columns text-center">
                    TODO Footer here
                </div>
            </div>
        </footer>

        <script src="/js/vendor/jquery.js"></script>
        <script src="/js/vendor/fastclick.js"></script>

        <script src="/js/foundation/foundation.js"></script>
        <script src="/js/foundation/foundation.topbar.js"></script>
        <script>
            $(document).foundation({
                topbar: {
                    back_text: 'zurück'
                }
            });
        </script>
    </body>
</html>