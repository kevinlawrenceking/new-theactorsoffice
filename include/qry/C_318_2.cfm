
<cftry>
    <cfset contactService = createObject("component", "/services/ContactService")>
    <cfset C = contactService.getContactDetails(userId=users.userid, selectContactId=select_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in C_318_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching contact details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
