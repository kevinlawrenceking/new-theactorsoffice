
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset e_insert = contactItemService.insertcontactitems(
        contactid = e.contactid,
        valueType = "Business",
        valueCategory = "Email",
        valueText = e.business_email,
        itemstatus = "Active"
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in e_insert_315_17.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
