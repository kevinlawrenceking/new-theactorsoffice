
<cftry>
    <cfset itemCategoryService = createObject("component", "services.ItemCategoryService")>
    <cfset types = itemCategoryService.SELitemcategory_24039(new_catid=new_catid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_198_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
