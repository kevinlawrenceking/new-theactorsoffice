
<cftry>
    <cfset result = new services.ContactItemService().insertcontactitems(
        contactid = g.contactid,
        valueType = 'Work',
        valueCategory = 'Phone',
        valueText = g.work_phone,
        itemstatus = 'Active'
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there's a function or query to update the database status --->
<cfcatch type="any">
    <cfset errorLog = "[Error in g_insert_315_21.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
