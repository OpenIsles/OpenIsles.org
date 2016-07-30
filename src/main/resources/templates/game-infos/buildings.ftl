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
            <#assign heading>
                <#switch buildingGroup.group>
                    <#case "ROAD">
                        <@translate lang="de">Straßen und Brücken</@translate>
                        <@translate lang="en">Roads and bridges</@translate>
                        <#break>
                    <#case "CRAFTSMAN">
                        <@translate lang="de">Handwerksbetriebe</@translate>
                        <@translate lang="en">Craftsmanship</@translate>
                        <#break>
                    <#case "FARM">
                        <@translate lang="de">Farmen &amp; Plantagen</@translate>
                        <@translate lang="en">Farms &amp; plantations</@translate>
                        <#break>
                    <#case "PORT">
                        <@translate lang="de">Hafenanlagen</@translate>
                        <@translate lang="en">Port facilities</@translate>
                        <#break>
                    <#case "PUBLIC">
                        <@translate lang="de">Öffentliche Gebäude</@translate>
                        <@translate lang="en">Public buildings</@translate>
                        <#break>
                </#switch>
            </#assign>
            <h2>${heading}</h2>

            <div class="card-group m-y-1">
                <#list buildingGroup.buildings as building>
                    <div class="card text-xs-center">
                        <a href="/game-infos/buildings/${building.name}.html">
                            <img class="card-img-top"
                                 src="//${staticHostName}/img/buildings/${building.name}/angle0.png"
                                 title="${building.title[siteLanguage]}" alt="${building.title[siteLanguage]}" />
                        </a>
                        <div class="card-block">
                            <p class="card-text">
                                ${building.title[siteLanguage]}
                            </p>
                        </div>
                    </div>
                </#list>
            </div>
        </#list>
    </div>
</div>
</@layout.page>