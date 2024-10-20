
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset Find = contactItemService.getcontactitems(
        contactid = currentid,
        valueCategory = categories.valuecategory,
        itemStatus = "Pending"
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Find_159_12.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
