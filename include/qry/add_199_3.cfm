
<cftry>
    <cfset result = createObject("component", "/services/ContactItemService").insertcontactitems(
        contactid = contactid,
        valuetype = trim(valuetype),
        itemStatus = "Active",
        valueCategory = valueCategory
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in add_199_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
