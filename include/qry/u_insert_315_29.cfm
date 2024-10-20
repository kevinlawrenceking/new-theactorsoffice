
<cftry>
    <cfset u_insert = new services.ContactItemService().insertcontactitems(
        contactid = u.contactid,
        valueType = 'Company Website',
        valueCategory = 'URL',
        valuetext = u.website,
        itemstatus = 'Active'
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in u_insert_315_29.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
