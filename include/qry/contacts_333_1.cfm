
<cftry>
    <cfset contactsService = createObject("component", "services.ContactService")>
    <cfset contacts = contactsService.getActiveContactDetails(userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in contacts_333_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving contact details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
