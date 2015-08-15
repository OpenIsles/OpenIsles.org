{extends "page-layout.tpl"}

{block "title"}404 Not Found{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<h1>404 Not Found</h1>

		<translate lang="de">
			<p>
				Die angeforderte Seite wurde nicht gefunden.<br />
				Vermutlich hast du dich vertippt oder hast einen ungültigen Link geklickt.
			</p>
			<p>
				<a href="/">Hier gehts zurück zur Startseite</a>
			</p>
		</translate>
		<translate lang="en">
			<p>
				The requested page was not found.<br />
				Perhaps you have mistyped or clicked on an invalid link.
			</p>
			<p>
				<a href="/">The homepage is that way</a>
			</p>
		</translate>
	</div>
</div>
{/block}