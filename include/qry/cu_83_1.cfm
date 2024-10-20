
<cftry>
    <cfset cu = createObject("component", "/services/ContactItemService").getvm_contactitems_itemcategory(currentid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in cu_83_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
