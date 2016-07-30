<#global title>
    <@translate lang="de">Waren – Spielinfos</@translate>
    <@translate lang="en">Goods – Game info</@translate>
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <h1>
            <@translate lang="de">Waren</@translate>
            <@translate lang="en">Goods</@translate>
        </h1>
        <p>
            <@translate lang="de">
                Im Spiel gibt es die folgenden Waren. Auf der <a href="/game-infos/buildings.html">Gebäudeübersicht</a>
                kannst du herausfinden, wie du sie herstellen kannst.
            </@translate>
            <@translate lang="en">
                In the game the following goods exist. You can find out how to produce these look at the
                <a href="/game-infos/buildings.html">Building's overview</a>.
            </@translate>
        </p>

        <#list goodGroups as goodGroup>
            <#assign heading>
                <#switch goodGroup.group>
                    <#case "RAW_MATERIAL">
                        <@translate lang="de">Rohstoffe</@translate>
                        <@translate lang="en">Row materials</@translate>
                        <#break>
                    <#case "CONSUMER_GOOD">
                        <@translate lang="de">Verbrauchsgüter</@translate>
                        <@translate lang="en">Consumer goods</@translate>
                        <#break>
                    <#case "BUILDING_MATERIAL">
                        <@translate lang="de">Baumaterialen</@translate>
                        <@translate lang="en">Building materials</@translate>
                        <#break>
                </#switch>
            </#assign>
            <h2>${heading}</h2>

            <div class="card-group m-y-1">
                <#list goodGroup.goods as good>
                    <div class="card text-xs-center">
                        <img class="card-img-top"
                             src="//${staticHostName}/img/goods/${good.iconName}.png"
                             title="${good.name[siteLanguage]}" alt="${good.name[siteLanguage]}" />
                        <div class="card-block">
                            <p class="card-text">
                                ${good.name[siteLanguage]}
                            </p>
                        </div>
                    </div>
                </#list>
            </div>
        </#list>
    </div>
</div>
</@layout.page>