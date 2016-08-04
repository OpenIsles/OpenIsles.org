<#global title>
    <@translate lang="de">Videos</@translate>
    <@translate lang="en">Videos</@translate>
</#global>

<#global additionalMetaTags>
    <#assign value>
        <@translate lang="de">Videos vom Spiel und der Entwicklung, chronologisch sortiert</@translate>
        <@translate lang="en">Videos from the game and development, ordered chronologically</@translate>
    </#assign>
    <meta name="description" value="${value}" />
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <@translate lang="de">
            <h1>Videos</h1>
            <p>
                Videos vom Spiel und der Entwicklung, chronologisch sortiert. Die neuesten Videos sind oben.
            </p>
        </@translate>
        <@translate lang="en">
            <h1>Videos</h1>
            <p>
                Videos from the game and development, ordered chronologically. The most recent videos are at the top.
            </p>
        </@translate>

        <div class="row">
            <#list videos as video>
                <div class="col-xs-12 col-md-6">
                    <div class="card text-xs-center">
                        <div class="card-block">
                            <div class="embed-responsive embed-responsive-13by10">
                                <video src="//${staticHostName}/media/videos/${video.urlName}.ogv" controls></video>
                            </div>

                            <p class="card-text">
                                <small>${video.createdDate?date?string.long}:</small>
                                <br />
                                ${i18n(video.descriptionKey)}
                            </p>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</div>
</@layout.page>