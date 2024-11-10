<cfset auditionUnionService = createObject("component", "services.AuditionUnionService")>
<cfset auditionUnionService.INSaudunions(
    new_unionName = new_unionName,
    new_countryid = new_countryid,
    new_audCatID = new_audCatID,
    new_isDeleted = new_isDeleted
)>