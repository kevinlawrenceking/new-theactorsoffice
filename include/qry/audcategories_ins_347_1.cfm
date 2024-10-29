
<cftry>
    <cfset variables.auditionCategoryService = new "/services/AuditionCategoryService.cfc"()>
    <cfset variables.auditionCategoryService.updateAudCategory(
        new_audCatName=new_audCatName, 
        new_isDeleted=new_isDeleted, 
        new_audCatId=new_audCatId
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcategories_ins_347_1.cfm]: #cfcatch.message#" type="error">
        <cfrethrow>
    </cfcatch>
</cftry>
