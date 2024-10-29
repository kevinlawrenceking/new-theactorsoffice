
<cftry>
    <cfset variables.auditionService = new "/services/AuditionSubcategorieService.cfc"()>
    <cfset variables.auditionService.insertAudSubCategory(
        new_audSubCatName = new_audSubCatName,
        new_audCatId = new_audCatId,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsubcategories_ins_421_1.cfm]: #cfcatch.message#"/>
        <cfthrow message="Error inserting into audsubcategories." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
