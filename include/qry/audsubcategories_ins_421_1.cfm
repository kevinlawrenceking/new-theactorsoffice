
<cftry>
    <cfset componentPath = "/services/AuditionSubcategorieService.cfc">
    <cfset componentInstance = createObject("component", componentPath)>
    <cfset componentInstance.INSaudsubcategories(
        new_audSubCatName = new_audSubCatName,
        new_audCatId = new_audCatId,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsubcategories_ins_421_1.cfm] #cfcatch.message#">
        <cfthrow message="Error calling INSaudsubcategories function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
