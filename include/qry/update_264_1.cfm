<cfset essenceService = createObject("component", "services.EssenceService")>
<cfset essenceService.UPDessences_24181(
    new_essenceName = form.new_essenceName,
    isdeleted = form.isdeleted,
    essenceid = form.essenceid
)>