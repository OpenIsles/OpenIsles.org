{extends "page-layout.tpl"}

{block "title"}
	{capture attr}
		<translate lang="de">Medien</translate>
		<translate lang="en">Media</translate>
	{/capture}
	{$smarty.capture.attr|trim}
{/block}

{block "additionalMetaTags"}
	{capture attr}
		<translate lang="de">Hier findest du Medienmaterial von OpenIsles.</translate>
		<translate lang="en">Here you will find media materials on OpenIsles.</translate>
	{/capture}
	<meta name="description" value="{$smarty.capture.attr|trim}" />
{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<h1>
			<translate lang="de">Medien</translate>
			<translate lang="en">Media</translate>
		</h1>
		<p>
			<translate lang="de">Hier findest du Medienmaterial von OpenIsles:</translate>
			<translate lang="en">Here you will find media materials about OpenIsles:</translate>
			<br />

			<a href="/media/screenshots.html">
				<translate lang="de">Screenshots</translate>
				<translate lang="en">Screenshots</translate>
			</a>
			<translate lang="de">und</translate>
			<translate lang="en">and</translate>
			<a href="/media/videos.html">
				<translate lang="de">Videos</translate>
				<translate lang="en">Videos</translate>
			</a>
		</p>
	</div>
</div>
{/block}