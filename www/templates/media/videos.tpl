<div class="row">
	<div class="small-12 columns">
		<h1>Videos</h1>
		<p>Hier sind einige Videos zum Spiel gelistet:</p>
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