
<cftry>
    <cfset itemCategoryService = createObject("component", "/services/ItemCategoryService")>
    <cfset c = itemCategoryService.getItemCategories()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in c_83_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
