
<cftry>
    <cfset itemCategoryService = createObject("component", "services.ItemCategoryService")>
    <cfset c = itemCategoryService.SELitemcategory()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in c_83_2.cfm] Error: #cfcatch.message#">
    </cfcatch>
</cftry>
