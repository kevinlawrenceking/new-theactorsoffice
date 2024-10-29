
<cftry>
    <cfset auditionCategoryService = new "/services/AuditionCategoryService.cfc"()>
    <cfset getCategories = auditionCategoryService.getAudSubcategories()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in getCategories_132_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
