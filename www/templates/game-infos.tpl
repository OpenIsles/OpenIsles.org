{extends "page-layout.tpl"}

{block "title"}
	{capture attr}
		<translate lang="de">Spielinfos</translate>
		<translate lang="en">Game info</translate>
	{/capture}
	{$smarty.capture.attr|trim}
{/block}

{block "additionalMetaTags"}
	{capture attr}
		<translate lang="de">Hier findest du alle Infos zum Spiel.</translate>
		<translate lang="en">Here you will find all information on the game.</translate>
	{/capture}
	<meta name="description" value="{$smarty.capture.attr|trim}" />
{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<h1>
			<translate lang="de">Spielinfos</translate>
			<translate lang="en">Game info</translate>
		</h1>
		<p>
			<translate lang="de">
				Hier findest du alle Infos zum Spiel. Die Bereiche sind alle noch nicht fertig,
				aber als Vorgeschmack schon mal angelegt.
			</translate>
			<translate lang="en">
				Here you will find all information on the game. The sections are not yet all done
				but already added as a foretaste.
			</translate>
		</p>
		<ul>
			<li>
				<a href="/game-infos/goods.html">
					<translate lang="de">Waren</translate>
					<translate lang="en">Goods</translate>
				</a>
			</li>
			<li>
				<a href="/game-infos/buildings.html">
					<translate lang="de">Gebäude</translate>
					<translate lang="en">Buildings</translate>
				</a>
			</li>
			<li>
				<a href="/game-infos/inhabitants.html">
					<translate lang="de">Einwohner</translate>
					<translate lang="en">Inhabitants</translate>
				</a>
			</li>
			<li>
				<a href="/game-infos/ships.html">
					<translate lang="de">Schiffe</translate>
					<translate lang="en">Ships</translate>
				</a>
			</li>
		</ul>
	</div>
</div>
{/block}