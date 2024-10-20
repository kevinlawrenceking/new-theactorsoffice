
<cftry>
    <cfset categories = createObject("component", "/services/ItemCategoryService").getvm_itemcategory_catdetails(catArea_UCB)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in categories_446_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
