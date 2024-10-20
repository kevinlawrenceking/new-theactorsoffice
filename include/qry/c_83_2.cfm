
<cftry>
    <cfset itemCategoryService = new services.ItemCategoryService()>
    <cfset c = itemCategoryService.getitemcategory()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in c_83_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
