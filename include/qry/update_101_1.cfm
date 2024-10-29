
<cftry>
    <cfset contactService = new services.ContactService()>
    <cfset contactService.updateContactDetails(idList=idlist)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_101_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
