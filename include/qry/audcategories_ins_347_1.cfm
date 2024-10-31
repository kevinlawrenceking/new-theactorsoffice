
<cftry>
    <cfset objService = createObject("component", "services.AuditionCategoryService")>
    <cfset objService.UPDaudcategories(
        new_audCatName = new_audCatName, 
        new_isDeleted = new_isDeleted, 
        new_audCatId = new_audCatId
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audcategories_ins_347_1.cfm]: #cfcatch.message#" type="error">
        <cfrethrow>
    </cfcatch>
</cftry>
