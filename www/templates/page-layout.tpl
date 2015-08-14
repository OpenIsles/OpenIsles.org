<!DOCTYPE html>
<html lang="de">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<meta name="author" content="Alexander Münch" />
		{capture assign=year}{$smarty.now|date_format:"%Y"}{/capture}
		{capture assign=copyright}Copyright © 2015{if $year != '2015'}-{$year}{/if}{/capture}
		<meta name="copyright" content="{$copyright|escape} Alexander Münch" />

		<meta name="robots" content="index, follow" />
		<meta name="language" content="de" />

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
			<nav class="top-bar" data-topbar>
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
						<li class="has-dropdown{if isset($navsActive['media'])} active{/if}">
							<a href="/media.html">Medien</a>
							<ul class="dropdown">
								<li{if isset($navsActive['media/screenshots'])} class="active"{/if}>
									<a href="/media/screenshots.html">Screenshots</a>
								</li>
								<li{if isset($navsActive['media/videos'])} class="active"{/if}>
									<a href="/media/videos.html">Videos</a>
								</li>
							</ul>
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
						<li>
							<a href="https://github.com/OpenIsles/OpenIsles/archive/master.zip"
							   class="alert button" target="_blank" rel="nofollow">
								<strong>Download</strong>
							</a>
						</li>
						<li>&nbsp;</li>
						<li>
							<a href="https://github.com/OpenIsles/" class="success button"
							   target="_blank" rel="nofollow">
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
				<div class="small-12 medium-4 columns small-only-text-center">
					OpenIsles – {$copyright}
					<br class="show-for-small-only" />Alexander Münch
					<br />powered by <a href="http://thehacker.biz" target="_blank" rel="nofollow">theHacker</a>
				</div>

				<div class="small-12 medium-4 columns text-center">
					<br class="show-for-small-only" />
					<a href="/contact.html">Kontakt &amp; Impressum</a> |
					<a href="/privacy.html">Datenschutz</a>
				</div>

				<div class="small-12 text-right medium-4 columns small-only-text-center">
					<br class="show-for-small-only" />
					<a href="http://www.w3.org/html/logo/" target="_blank" rel="nofollow" class="noLinkBackground">
						<img src="/img/html5-badge-h-css3-multimedia-semantics.png" width="197" height="64"
							 alt="HTML5 Powered with CSS3 / Styling, Multimedia, and Semantics"
							 title="HTML5 Powered with CSS3 / Styling, Multimedia, and Semantics" />
					</a>
				</div>
			</div>
		</footer>

		<script src="/js/vendor/jquery.js"></script>
		<script src="/js/vendor/fastclick.js"></script>

		<script src="/js/foundation/foundation.js"></script>
		<script src="/js/foundation/foundation.clearing.js"></script>
		<script src="/js/foundation/foundation.topbar.js"></script>
		<script>
			$(document).foundation({
				topbar: {
					back_text: 'zurück'
				}
			});
		</script>

		{$piwikIdSite=(isset($isLocalDevelopment)) ? 3 : 1}
		<script type="text/javascript">
			var _paq = _paq || [];
			_paq.push(['trackPageView']);
			_paq.push(['enableLinkTracking']);
			(function() {
				var u = "//piwik.thehacker.biz/";
				_paq.push(['setTrackerUrl', u + 'piwik.php']);
				_paq.push(['setSiteId', {$piwikIdSite}]);
				var d = document, g = d.createElement('script'), s = d.getElementsByTagName('script')[0];
				g.type = 'text/javascript';
				g.async = true;
				g.defer = true;
				g.src = u + 'piwik.js';
				s.parentNode.insertBefore(g, s);
			})();
		</script>
		<noscript><img src="//piwik.thehacker.biz/piwik.php?idsite={$piwikIdSite}" alt="" /></noscript>
	</body>
</html>