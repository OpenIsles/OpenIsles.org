<!DOCTYPE html>
<html lang="{$siteLanguage}">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<meta name="author" content="Alexander Münch" />
		{capture assign=year}{$smarty.now|date_format:"%Y"}{/capture}
		{capture assign=copyright}Copyright © 2015{if $year != '2015'}-{$year}{/if}{/capture}
		<meta name="copyright" content="{$copyright|escape} Alexander Münch" />

		{block "additionalMetaTags"}{/block}

		<meta name="robots" content="index, follow" />
		<meta name="language" content="{$siteLanguage}" />

		{foreach $languageMap as $lang => $langName}
			<link rel="alternate" hreflang="{$lang}" href="{$alternateUrls[$lang]|escape}" />
		{/foreach}

		{capture "title"}{block "title"}{/block}{/capture}
		<title>
			{if $smarty.capture.title != ''}{$smarty.capture.title} – OpenIsles
			{else}
				<translate lang="de">OpenIsles – das freie Insel-Aufbauspiel</translate>
				<translate lang="en">OpenIsles – the free island-building game</translate>
			{/if}
		</title>

		<link rel="stylesheet" href="//{$staticHostName}/css/normalize.css" />
		<link rel="stylesheet" href="//{$staticHostName}/css/foundation.min.css" />
		<link rel="stylesheet" href="//{$staticHostName}/css/openisles.css" />

		<script src="//{$staticHostName}/js/vendor/modernizr.js"></script>
	</head>

	<body {if $isSearchCrawler}class="no-cookie-warning"{/if}>
		<header id="site-header">
			<div class="row text-center show-for-medium-up">
				<h1><span class="open">Open</span><span class="isles">Isles</span></h1>
				<h2>
					<translate lang="de">das freie Insel-Aufbauspiel</translate>
					<translate lang="en">the free island-building game</translate>
				</h2>
			</div>
			<div class="row text-center show-for-small-only">
				<h1><span class="open">Open</span><span class="isles">Isles</span></h1>
				<h2>
					<translate lang="de">das freie Insel-Aufbauspiel</translate>
					<translate lang="en">the free island-building game</translate>
				</h2>
			</div>
			{if isset($isLocalDevelopment)}
				<div class="row text-center" style="color: red; font-size: 30px; font-weight: bold;">
					– localDevelopment-Flag gesetzt –
				</div>
			{/if}
		</header>

		<div class="contain-to-grid sticky">
			<nav class="top-bar" data-topbar>
				<ul class="title-area">
					<li class="name">
						<h1><a href="/">OpenIsles</a></h1>
					</li>
					<li class="toggle-topbar menu-icon"><a href="#"><span>
						<translate lang="de">Menü</translate>
						<translate lang="en">Menu</translate>
					</span></a></li>
				</ul>

				<section class="top-bar-section">
					<ul class="left">
						<li{if isset($navsActive['home'])} class="active"{/if}>
							<a href="/">
								<translate lang="de">Startseite</translate>
								<translate lang="en">Home</translate>
							</a>
						</li>
						<li{if isset($navsActive['faq'])} class="active"{/if}>
							<a href="/faq.html">
								<translate lang="de">FAQ</translate>
								<translate lang="en">FAQ</translate>
							</a>
						</li>
						<li class="has-dropdown{if isset($navsActive['media'])} active{/if}">
							<a href="/media.html">
								<translate lang="de">Medien</translate>
								<translate lang="en">Media</translate>
							</a>
							<ul class="dropdown">
								<li{if isset($navsActive['media/screenshots'])} class="active"{/if}>
									<a href="/media/screenshots.html">
										<translate lang="de">Screenshots</translate>
										<translate lang="en">Screenshots</translate>
									</a>
								</li>
								<li{if isset($navsActive['media/videos'])} class="active"{/if}>
									<a href="/media/videos.html">
										<translate lang="de">Videos</translate>
										<translate lang="en">Videos</translate>
									</a>
								</li>
							</ul>
						</li>
						<li class="has-dropdown{if isset($navsActive['game-infos'])} active{/if}">
							<a href="/game-infos.html">
								<translate lang="de">Spielinfos</translate>
								<translate lang="en">Game info</translate>
							</a>
							<ul class="dropdown">
								<li{if isset($navsActive['game-infos/goods'])} class="active"{/if}>
									<a href="/game-infos/goods.html">
										<translate lang="de">Waren</translate>
										<translate lang="en">Goods</translate>
									</a>
								</li>
								<li{if isset($navsActive['game-infos/buildings'])} class="active"{/if}>
									<a href="/game-infos/buildings.html">
										<translate lang="de">Gebäude</translate>
										<translate lang="en">Buildings</translate>
									</a>
								</li>
								<li{if isset($navsActive['game-infos/inhabitants'])} class="active"{/if}>
									<a href="/game-infos/inhabitants.html">
										<translate lang="de">Einwohner</translate>
										<translate lang="en">Inhabitants</translate>
									</a>
								</li>
								<li{if isset($navsActive['game-infos/ships'])} class="active"{/if}>
									<a href="/game-infos/ships.html">
										<translate lang="de">Schiffe</translate>
										<translate lang="en">Ships</translate>
									</a>
								</li>
							</ul>
						</li>
					</ul>

					<ul class="right">
						{*<li>
							<a href="https://github.com/OpenIsles/OpenIsles/archive/master.zip"
							   class="alert button" target="_blank" rel="nofollow">
								<strong>Download</strong>
							</a>
						</li>
						<li>&nbsp;</li>*}
						<li>
							<a href="/privacy.html" id="cookie-warning-button">
								<translate lang="de">
									<img src="//{$staticHostName}/img/cookie.svg"
										 style="width: 24px; height: 24px;" alt="Cookie-Warnung!"
										 title="Diese Seite verwendet Cookies. Klick hier für mehr Infos." />
								</translate>
								<translate lang="en">
									<img src="//{$staticHostName}/img/cookie.svg"
										 style="width: 24px; height: 24px;" alt="Cookie warning!"
										 title="This website uses cookies. Click here for more information." />
								</translate>
							</a>
						</li>
						<li>&nbsp;</li>
						<li>
							<a href="https://github.com/OpenIsles/" class="success button"
							   target="_blank" rel="nofollow">
								<img src="//{$staticHostName}/img/github-white.png" alt="GitHub"
									 style="vertical-align: baseline; width: 12px; height: 12px;"/>
								GitHub
							</a>
						</li>
						<li style="padding-right: 10px;">&nbsp;</li>
						{foreach $languageMap as $lang => $langName}
						<li>
							<a href="{$alternateUrls[$lang]|escape}"
							   class="button lang{if $lang == $siteLanguage} selected{/if}">
								<img src="//{$staticHostName}/img/flags/{$lang}.png"
									 alt="{$langName}" title="{$langName}" />
							</a>
						</li>
						{/foreach}
					</ul>
				</section>
			</nav>
		</div>

		<section id="page-wrapper">
			{block "pageContent"}{/block}
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
					<a href="/contact.html">
						<translate lang="de">Kontakt &amp; Impressum</translate>
						<translate lang="en">Contact &amp; Imprint</translate>
					</a> |
					<a href="/privacy.html">
						<translate lang="de">Datenschutz</translate>
						<translate lang="en">Privacy</translate>
					</a>
				</div>

				<div class="small-12 text-right medium-4 columns small-only-text-center">
					<br class="show-for-small-only" />
					<a href="http://www.w3.org/html/logo/" target="_blank" rel="nofollow" class="noLinkBackground">
						<img src="//{$staticHostName}/img/html5-badge-h-css3-multimedia-semantics-storage.png"
							 width="197" height="64"
							 alt="HTML5 Powered with CSS3 / Styling, Multimedia, Semantics, and Offline &amp; Storage"
							 title="HTML5 Powered with CSS3 / Styling, Multimedia, Semantics, and Offline &amp; Storage" />
					</a>
				</div>
			</div>
		</footer>

		<script src="//{$staticHostName}/js/vendor/jquery.js"></script>
		<script src="//{$staticHostName}/js/vendor/fastclick.js"></script>

		<script src="//{$staticHostName}/js/foundation/foundation.js"></script>
		<script src="//{$staticHostName}/js/foundation/foundation.equalizer.js"></script>
		<script src="//{$staticHostName}/js/foundation/foundation.reveal.js"></script>
		<script src="//{$staticHostName}/js/foundation/foundation.topbar.js"></script>

		{capture backText}
			<translate lang="de">zurück</translate>
			<translate lang="en">back</translate>
		{/capture}
		<script>
			$(document).foundation({
				equalizer: {
					equalize_on_stack: true
				},
				topbar: {
					back_text: '{$smarty.capture.backText|trim}'
				}
			});
		</script>

		<script src="//{$staticHostName}/js/jquery-ui.min.js"></script>

		<div id="cookie-warning" class="reveal-modal" data-reveal>
			<div class="row">
				<div class="small-12 medium-4 columns">
					<img src="//{$staticHostName}/img/cookie.svg" alt="" style="width: 256px; height: 256px; float: left;" />
				</div>
				<div class="small-12 medium-8 columns">
					<a class="close-reveal-modal">&#215;</a>

					<translate lang="de">
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
					</translate>
					<translate lang="en">
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
					</translate>
				</div>
			</div>
		</div>
		<script src="//{$staticHostName}/js/cookie-warning.js"></script>

		{$piwikIdSite=(isset($isLocalDevelopment)) ? 3 : 1}
		<script type="text/javascript">
			var _paq = _paq || [];
			_paq.push(['setCustomVariable', 1, 'siteLanguage', '{$siteLanguage}', 'page']);
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