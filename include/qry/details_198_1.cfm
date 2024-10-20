
<cftry>
    <cfset itemCategoryService = new "/services/ItemCategoryService.cfc"()>
    <cfset details = itemCategoryService.getitemcategory(new_catid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_198_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
