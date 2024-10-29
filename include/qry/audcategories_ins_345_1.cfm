
<cftry>
    <cfset variables.auditionCategoryService = createObject("component", "services.AuditionCategoryService")>
    <cfset variables.auditionCategoryService.insertAudCategory(new_audCatName=new_audCatName, new_isDeleted=new_isDeleted)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcategories_ins_345_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the category." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
