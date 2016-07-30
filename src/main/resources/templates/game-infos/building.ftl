<#global title>
    ${building.title[siteLanguage]} –
    <@translate lang="de">Gebäude – Spielinfos</@translate>
    <@translate lang="en">Buildings – Game info</@translate>
</#global>

<@layout.page>
<div class="row">
    <div class="col-xs-12">
        <h1>${building.title[siteLanguage]}</h1>

        <figure>
            <figcaption>
                <@translate lang="de">Ansicht von allen vier Richtungen</@translate>
                <@translate lang="en">View from all four directions</@translate>
            </figcaption>
            <div class="row">
                <#list 0..3 as i>
                    <#assign angle = i * 90>
                    <div class="col-xs-6 col-md-3 text-xs-center">
                        <img src="//${staticHostName}/img/buildings/${building.name}/angle${angle}.png"
                             alt="${angle}°" />
                    </div>
                </#list>
            </div>
        </figure>
    </div>
</div>
</@layout.page>