
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset result = contactItemService.insertcontactitems(
        CONTACTID = CONTACTID,
        VALUETYPE = "Tags",
        VALUECATEGORY = "Tag",
        VALUETEXT = left(new_valuetext, 40),
        ITEMSTATUS = "Active"
    )>
    <cfcatch type="any">
        <cfset errorLog("[Error in insert_298_5.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
