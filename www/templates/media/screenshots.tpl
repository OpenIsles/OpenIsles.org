<div class="row">
	<div class="small-12 columns">
		<h1>Screenshots</h1>
		<p>Eindrücke vom Spiel. Klick die Thumbnails an, um sie vergrößert und mit Beschreibung anzuzeigen.</p>
		<ul class="clearing-thumbs large-block-grid-4" data-clearing>
			{foreach $screenshots as $screenshot}
				<li>
					<a href="/media/screenshots/{$screenshot.fileprefix}.png">
						<img src="/media/screenshots/{$screenshot.fileprefix}.thumb.png"
							 data-caption="<span class='screenshot-date'>{$screenshot.date|date_format:"%e. %B %Y, %T"} Uhr:</span><br />{$screenshot.description|escape}" />
					</a>
				</li>
			{/foreach}
		</ul>
	</div>
</div>