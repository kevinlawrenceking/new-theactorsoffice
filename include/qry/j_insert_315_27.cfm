
<cftry>
    <cfset j_insert = new services.ContactItemService().insertcontactitems(
        contactid = j.contactid,
        valueType = 'Company',
        valueCategory = 'Company',
        valuecompany = j.company,
        itemstatus = 'Active'
    )>
    <cfcatch>
        <cfset errorLog = "[Error in j_insert_315_27.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
