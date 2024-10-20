
<cftry>
    <cfset types = createObject("component", "services.ItemCategoryService").getvm_itemcategory_itemtypes(new_catid, userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in types_198_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
