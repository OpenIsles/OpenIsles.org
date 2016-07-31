<#global title>
    <@translate lang="de">Gebäude – Spielinfos</@translate>
    <@translate lang="en">Buildings – Game info</@translate>
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <h1>
            <@translate lang="de">Gebäude</@translate>
            <@translate lang="en">Buildings</@translate>
        </h1>
        <p>
            <@translate lang="de">
                Im Spiel gibt es die folgenden Gebäude. Klick ein Gebäude an, um weitere Informationen darüber
                zu erhalten.
            </@translate>
            <@translate lang="en">
                In the game the following buildings exist. Click a building to get further information about it.
            </@translate>
        </p>

        <#list buildingGroups as buildingGroup>
            <h2>${i18n(buildingGroup.group.titleKey)}</h2>

            <div class="card-group m-y-1">
                <#list buildingGroup.buildings as building>
                    <div class="card text-xs-center">
                        <a href="/game-infos/buildings/${building.name}.html">
                            <img class="card-img-top"
                                 src="//${staticHostName}/img/buildings/${building.name}/angle0.png"
                                 title="${i18n(building.titleKey)}" alt="${i18n(building.titleKey)}" />
                        </a>
                        <div class="card-block">
                            <p class="card-text">
                                ${i18n(building.titleKey)}
                            </p>
                        </div>
                    </div>
                </#list>
            </div>
        </#list>
    </div>
</div>
</@layout.page>