
<cftry>
    <cfset x = createObject("component", "/services/ItemCategoryService").getvm_itemcategory_itemtypes()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_318_34.cfm]: " & cfcatch.message>
        <cflog text="#errorLog#" type="error">
    </cfcatch>
</cftry>
