{extends "page-layout.tpl"}

{block "title"}
	{capture attr}
		<translate lang="de">{$screenshot.title|escape} – Screenshot</translate>
		<translate lang="en">{$screenshot.title|escape} – Screenshot</translate>
	{/capture}
	{$smarty.capture.attr|trim}
{/block}

{block "additionalMetaTags"}
	<link rel="up" href="/media/screenshots.html" />

	<translate lang="de"><meta name="description" value="Screenshot: {$screenshot.description|escape}" /></translate>
	<translate lang="en"><meta name="description" value="Screenshot: {$screenshot.description|escape}" /></translate>
{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<h1>
			<translate lang="de">Screenshot</translate>
			<translate lang="en">Screenshot</translate>
		</h1>
	</div>
</div>

<div class="row">
	<div class="small-12 columns">
		<div class="clearfix">
			<div class="left">
				<a href="/media/screenshots/{$screenshot.prev.url_name}.html">
					<span class="show-for-medium-up">
						<translate lang="de">◀&nbsp;vorheriger</translate>
						<translate lang="en">◀&nbsp;previous</translate>
					</span>
					<span class="show-for-small-only">◀</span>
				</a>
			</div>
			<div class="right">
				<a href="/media/screenshots/{$screenshot.next.url_name}.html">
					<span class="show-for-medium-up">
						<translate lang="de">nächster&nbsp;▶</translate>
						<translate lang="en">next&nbsp;▶</translate>
					</span>
					<span class="show-for-small-only">▶</span>
				</a>
			</div>
			<div>
				<h2 class="small-header text-center">{$screenshot.title|escape}</h2>
			</div>
		</div>

		<p class="text-center">
			<a href="/media/screenshots/{$screenshot.next.url_name}.html">
				<img src="//{$staticHostName}/media/screenshots/{$screenshot.url_name}.png"
					 title="{$screenshot.title|escape}"
					 alt="{$screenshot.description|escape}" />
			</a>

			<br />
			<a href="//{$staticHostName}/media/screenshots/{$screenshot.url_name}.png" target="_blank">
				<translate lang="de">(Bild im neuen Tab öffnen)</translate>
				<translate lang="en">(Open picture in new tab)</translate>
			</a>
		</p>
		<p class="text-center">
			{$screenshot.description|escape}
			<br />

			<span class='media-date'>
				{$screenshot.created_date|date_format:"%e. %B %Y"}
			</span>
		</p>
	</div>
</div>
{/block}