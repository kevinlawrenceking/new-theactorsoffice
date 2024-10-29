
<cftry>
    <cfset var eventContactsXRefService = createObject("component", "/services/EventContactsXRefService")>
    <cfset eventContactsXRefService.updateEventContacts(deletecontactid=deletecontactid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete2_368_8.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating event contacts." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
