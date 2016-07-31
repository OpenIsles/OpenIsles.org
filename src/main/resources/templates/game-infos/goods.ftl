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
            <h2>${i18n(goodGroup.group.titleKey)}</h2>

            <div class="card-group m-y-1">
                <#list goodGroup.goods as good>
                    <div class="card text-xs-center">
                        <img class="card-img-top"
                             src="//${staticHostName}/img/goods/${good.name}.png"
                             title="${i18n(good.titleKey)}" alt="${i18n(good.titleKey)}" />
                        <div class="card-block">
                            <p class="card-text">
                                ${i18n(good.titleKey)}
                            </p>
                        </div>
                    </div>
                </#list>
            </div>
        </#list>
    </div>
</div>
</@layout.page>