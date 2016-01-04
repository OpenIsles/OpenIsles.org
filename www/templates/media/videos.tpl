{extends "page-layout.tpl"}

{block "title"}
	{capture attr}
		<translate lang="de">Videos</translate>
		<translate lang="en">Videos</translate>
	{/capture}
	{$smarty.capture.attr|trim}
{/block}

{block "additionalMetaTags"}
	<link rel="up" href="/media.html" />

	{capture attr}
		<translate lang="de">Videos vom Spiel und der Entwicklung, chronologisch sortiert</translate>
		<translate lang="en">Videos from the game and development, ordered chronologically</translate>
	{/capture}
	<meta name="description" value="{$smarty.capture.attr|trim}" />
{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<translate lang="de">
			<h1>Videos</h1>
			<p>
				Videos vom Spiel und der Entwicklung, chronologisch sortiert. Die neuesten Videos sind oben.
				<small>Ok, sind erst zwei Stück ;-)</small>
			</p>
		</translate>
		<translate lang="en">
			<h1>Videos</h1>
			<p>
				Videos from the game and development, ordered chronologically. The most recent videos are at the top.
				<small>Ok, there are only two ones ;-)</small>
			</p>
		</translate>

		<ul class="large-block-grid-2">
			{foreach $videos as $video}
				<li>
					<div class="flex-video">
						<video src="//{$staticHostName}/media/videos/{$video.fileprefix}.ogv" controls></video>
					</div>
					<p>
						<span class='media-date'>{$video.date|date_format:"%e. %B %Y"}:</span>
						<br />
						<translate lang="de">
							{$video.description.de|escape}
						</translate>
						<translate lang="en">
							{$video.description.en|escape}
						</translate>
					</p>
				</li>
			{/foreach}
		</ul>
	</div>
</div>
{/block}