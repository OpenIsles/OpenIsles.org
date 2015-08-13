<div class="row">
	<div class="small-12 columns">
		<h1>Screenshots</h1>
		<p>
			Impressionen vom Spiel und der Entwicklung, chronologisch sortiert. Die neuesten Screenshots sind oben.
			<br />
			Klick die Thumbnails an, um die Screenshots vergrößert und mit Beschreibung anzuzeigen.
		</p>
		<ul class="clearing-thumbs large-block-grid-4" data-clearing>
			{foreach $screenshots as $screenshot}
				<li>
					<a href="/media/screenshots/{$screenshot.fileprefix}.png">
						<img src="/media/screenshots/{$screenshot.fileprefix}.thumb.png"
							 data-caption="<span class='media-date'>{$screenshot.date|date_format:"%e. %B %Y, %T"} Uhr:</span><br />{$screenshot.description|escape}" />
					</a>
				</li>
			{/foreach}
		</ul>
	</div>
</div>