
<cftry>
    <cfset details = createObject("component", "services.ItemCategoryService").DETitemcategory(catid=new_catid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_198_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
