{extends "page-layout.tpl"}

{block "title"}
	{capture attr}
		<translate lang="de">Screenshots</translate>
		<translate lang="en">Screenshots</translate>
	{/capture}
	{$smarty.capture.attr|trim}
{/block}

{block "additionalMetaTags"}
	<link rel="up" href="/media.html" />

	{capture attr}
		<translate lang="de">Impressionen vom Spiel und der Entwicklung, chronologisch sortiert</translate>
		<translate lang="en">Impressions from the game and development, ordered chronologically</translate>
	{/capture}
	<meta name="description" value="{$smarty.capture.attr|trim}" />
{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<translate lang="de">
			<h1>Screenshots</h1>
			<p>
				Impressionen vom Spiel und der Entwicklung, chronologisch sortiert. Die neuesten Screenshots sind oben.
				<br />
				Klick die Thumbnails an, um die Screenshots vergrößert und mit Beschreibung anzuzeigen.
			</p>
		</translate>
		<translate lang="en">
			<h1>Screenshots</h1>
			<p>
				Impressions from the game and development, ordered chronologically. The most recent screenshots
				are at the top.
				<br />
				Click on the thumbnails to display the screenshots enlarged and with description.
			</p>
		</translate>

		<ul class="clearing-thumbs large-block-grid-4" data-clearing>
			{foreach $screenshots as $screenshot}
				<li>
					<a href="/media/screenshots/{$screenshot.fileprefix}.png">
						{capture attr}
							<translate lang="de">
								<span class='media-date'>{$screenshot.date|date_format:"%e. %B %Y, %T"} Uhr</span><br />{$screenshot.description.de|escape}
							</translate>
							<translate lang="en">
								<span class='media-date'>{$screenshot.date|date_format:"%e. %B %Y, %T"}</span><br />{$screenshot.description.en|escape}
							</translate>
						{/capture}
						<img src="/media/screenshots/{$screenshot.fileprefix}.thumb.png"
							 data-caption="{$smarty.capture.attr|trim}" />
					</a>
				</li>
			{/foreach}
		</ul>
	</div>
</div>
{/block}