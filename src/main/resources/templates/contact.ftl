<#global title>
    <@translate lang="de">Kontakt &amp; Impressum</@translate>
    <@translate lang="en">Contact &amp; Imprint</@translate>
</#global>

<#global additionalMetaTags>
    <#assign value>
        <@translate lang="de">OpenIsles und diese Webseite sind ein Projekt von theHacker – Alexander Münch</@translate>
        <@translate lang="en">OpenIsles and this website are a project of theHacker – Alexander Münch</@translate>
    </#assign>
    <meta name="description" value="${value}" />
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <h1>
            <@translate lang="de">Kontakt &amp; Impressum</@translate>
            <@translate lang="en">Contact &amp; Imprint</@translate>
        </h1>
        <p>
            <@translate lang="de"><b>OpenIsles</b> und diese Webseite sind ein Projekt von</@translate>
            <@translate lang="en"><b>OpenIsles</b> and this website are a project of</@translate>
        </p>
        <address>
            <strong>theHacker</strong><br />
            Alexander Münch<br />
            Jahnstraße 23<br />
            90547 Stein<br />
            <a href="javascript:return false;">webmaster (at) openisles.org</a>
        </address>

        <p>
            <@translate lang="de">
                Flaggen-Icons von <a href="http://www.famfamfam.com/lab/icons/flags/">famfamfam.com</a>.<br />
                HTML5-Logo von <a href="http://www.w3.org/"><abbr title="World Wide Web Consortium">W3C</abbr></a>.<br />
                Danke.
            </@translate>
            <@translate lang="en">
                Flag icons by <a href="http://www.famfamfam.com/lab/icons/flags/">famfamfam.com</a>.<br />
                HTML5 logo by <a href="http://www.w3.org/"><abbr title="World Wide Web Consortium">W3C</abbr></a>.<br />
                Thanks.
            </@translate>
        </p>
    </div>
</div>
</@layout.page>