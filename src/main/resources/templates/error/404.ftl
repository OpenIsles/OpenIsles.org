<#global title>
    404 Not Found
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <h1>404 Not Found</h1>

        <@translate lang="de">
            <p>
                Die angeforderte Seite wurde nicht gefunden.<br />
                Vermutlich hast du dich vertippt oder hast einen ungültigen Link geklickt.
            </p>
            <p>
                <a href="/">Hier gehts zurück zur Startseite</a>
            </p>
        </@translate>
        <@translate lang="en">
            <p>
                The requested page was not found.<br />
                Perhaps you have mistyped or clicked on an invalid link.
            </p>
            <p>
                <a href="/">The homepage is that way</a>
            </p>
        </@translate>
    </div>
</div>
</@layout.page>