
<cftry>
    <cfset variables.auditionSubcategorieService = createObject("component", "services.AuditionSubcategorieService")>
    <cfset variables.auditionSubcategorieService.updateAudSubCategory(
        new_audSubCatName = trim(new_audSubCatName),
        new_audCatId = new_audCatId,
        new_isDeleted = new_isDeleted,
        new_audSubCatId = new_audSubCatId
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsubcategories_ins_423_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the subcategory." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>

