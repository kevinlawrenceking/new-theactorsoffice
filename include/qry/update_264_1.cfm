<cfset essenceService = createObject("component", "services.EssenceService")>
<cfset essenceService.UPDessences_24181(
    new_essenceName = form.new_essenceName,
    <Cfif isdefined('form.isdeleted')>
    isdeleted = form.isdeleted,
    </cfif>
    essenceid = form.essenceid
)>