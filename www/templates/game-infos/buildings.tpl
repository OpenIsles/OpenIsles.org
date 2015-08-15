{extends "page-layout.tpl"}

{block "title"}
	{capture attr}
		<translate lang="de">Gebäude – Spielinfos</translate>
		<translate lang="en">Buildings – Game info</translate>
	{/capture}
	{$smarty.capture.attr|trim}
{/block}

{block "additionalMetaTags"}
	<link rel="up" href="/game-infos.html" />
{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<h1>
			<translate lang="de">Gebäude</translate>
			<translate lang="en">Buildings</translate>
		</h1>
		<p>
			<translate lang="de">
				- Baustelle - Sorry, dieser Bereich ist noch nicht fertig.<br />
				Ich habs mir aber nicht nehmen lassen, schon die
				Navigationspunkte anzulegen, damit du siehst, was noch kommen wird… :-)
			</translate>
			<translate lang="en">
				- Construction area - Sorry, but this area is not yet done.<br />
				I couldn't resist however adding the navigation points already, so you'll
				see what is going to come… :-)
			</translate>
		</p>
	</div>
</div>
{/block}