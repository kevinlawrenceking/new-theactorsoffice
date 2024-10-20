
<cftry>
    <cfset result = new services.ContactItemService().insertcontactitems(
        contactid = f.contactid,
        valueType = 'Personal',
        valueCategory = 'Email',
        valueText = f.personal_email,
        itemstatus = 'Active'
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in f_insert_315_19.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
