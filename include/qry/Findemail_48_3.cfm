
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset Findemail = contactItemService.getActiveEmail(contactID=audcontacts.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findemail_48_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
