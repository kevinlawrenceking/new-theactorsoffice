
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset result = contactItemService.insertcontactitems(
        contactID = currentid,
        valueType = categories.valueTypeDef,
        valuecategory = categories.valuecategory,
        itemStatus = "Pending"
    ) />
    <cfset isfetch = 1 />
<cfcatch type="any">
    <cfset errorLog = "[Error in Insert_159_13.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
