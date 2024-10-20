
<cftry>
    <cfset ContactItemService = new "/services/ContactItemService.cfc"()>
    <cfset result = ContactItemService.insertcontactitems(
        contactid = i.contactid,
        valueType = 'Home',
        valueCategory = 'Phone',
        valueText = i.home_phone,
        itemstatus = 'Active'
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in i_insert_315_25.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
