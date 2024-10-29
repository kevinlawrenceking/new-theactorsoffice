
<cftry>
    <cfset itemCategoryService = createObject("component", "/services/ItemCategoryService")>
    <cfset x = itemCategoryService.getDistinctCategoriesAndValueTypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_318_34.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
