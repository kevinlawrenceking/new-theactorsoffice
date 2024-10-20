
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset findscope_old = contactItemService.getcontactitems({
        valuecategory: 'Tag',
        valuetext: 'Casting Director',
        contactid: contactid,
        itemstatus: 'Active'
    })>
<cfcatch type="any">
    <cfset errorLog = "[Error in findscope_old_294_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
