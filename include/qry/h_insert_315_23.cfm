
<cftry>
    <cfset h_insert = new services.ContactItemService().insertcontactitems(
        contactid = h.contactid,
        valueType = 'Mobile',
        valueCategory = 'Phone',
        valueText = h.mobile_phone,
        itemstatus = 'Active'
    )>
    <cfcatch>
        <cfset errorLog = "[Error in h_insert_315_23.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
