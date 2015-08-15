{extends "page-layout.tpl"}

{block "title"}
	{capture attr}
		<translate lang="de">Kontakt &amp; Impressum</translate>
		<translate lang="en">Contact &amp; Imprint</translate>
	{/capture}
	{$smarty.capture.attr|trim}
{/block}

{block "additionalMetaTags"}
	{capture attr}
		<translate lang="de">OpenIsles und diese Webseite sind ein Projekt von theHacker – Alexander Münch</translate>
		<translate lang="en">OpenIsles and this website are a project of theHacker – Alexander Münch</translate>
	{/capture}
	<meta name="description" value="{$smarty.capture.attr|trim}" />
{/block}

{block "pageContent"}
<div class="row">
	<div class="small-12 columns">
		<h1>
			<translate lang="de">Kontakt &amp; Impressum</translate>
			<translate lang="en">Contact &amp; Imprint</translate>
		</h1>
		<p>
			<translate lang="de"><b>OpenIsles</b> und diese Webseite sind ein Projekt von</translate>
			<translate lang="en"><b>OpenIsles</b> and this website are a project of</translate>
		</p>
		<ul class="vcard">
			<li class="nickname">theHacker</li>
			<li class="fn">Alexander Münch</li>
			<li class="street-address">Jahnstraße 23</li>
			<li><span class="zip">90547</span> <span class="locality">Stein</span></li>
			<li class="email"><a href="javascript:return false;">webmaster (at) openisles.org</a></li>
		</ul>

		<p>
			<translate lang="de">
				Flaggen-Icons von <a href="http://www.famfamfam.com/lab/icons/flags/">famfamfam.com</a>. Danke.
			</translate>
			<translate lang="en">
				Flag icons by <a href="http://www.famfamfam.com/lab/icons/flags/">famfamfam.com</a>. Thanks.
			</translate>
		</p>
	</div>
</div>
{/block}