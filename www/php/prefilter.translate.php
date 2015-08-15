<?php

/**
 * Smarty-Prefilter-Plugin, dass "<translate>"-Tags nimmt und Text je nach Sprache durchlässt oder rausfiltert.
 *
 * Beispiel:
 *   <translate lang="de">Beispiel</translate>
 *   <translate lang="en">
 *     Example
 *   </translate>
 *
 * @see http://www.smarty.net/docs/en/plugins.prefilters.postfilters.tpl
 */
function smarty_prefilter_translate($source, Smarty_Internal_Template $template) {
	$targetLang = $template->smarty->compile_id;

	return preg_replace_callback('~<translate lang="(\w+)">(.*?)</translate>~s',
		function($matches) use ($targetLang) {
			return ($matches[1] == $targetLang) ? $matches[2] : '';
		}, $source);
}