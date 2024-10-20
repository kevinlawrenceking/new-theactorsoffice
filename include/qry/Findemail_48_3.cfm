
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset Findemail = contactItemService.getcontactitems({
        valueCategory: 'Email',
        contactID: audcontacts.contactid,
        itemStatus: 'Active',
        orderBy: 'primary_YN DESC',
        limit: 1
    }) />
<cfcatch type="any">
    <cfset errorLog = "[Error in Findemail_48_3.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
