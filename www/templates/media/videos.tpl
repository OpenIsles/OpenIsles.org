{extends "page-layout.tpl"}

{block "title"}Videos{/block}

{block "additionalMetaTags"}
	<link rel="up" href="/media.html" />
	<meta name="description" value="Videos vom Spiel und der Entwicklung, chronologisch sortiert" />
{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<h1>Videos</h1>
		<p>
			Videos vom Spiel und der Entwicklung, chronologisch sortiert. Die neuesten Videos sind oben.
			<small>Ok, sind erst zwei Stück ;-)</small>
		</p>
		<ul class="large-block-grid-2">
			{foreach $videos as $video}
				<li>
					<div class="flex-video">
						<video src="/media/videos/{$video.fileprefix}.ogv" controls></video>
					</div>
					<p>
						<span class='media-date'>{$video.date|date_format:"%e. %B %Y"}:</span>
						<br />{$video.description|escape}
					</p>
				</li>
			{/foreach}
		</ul>
	</div>
</div>
{/block}