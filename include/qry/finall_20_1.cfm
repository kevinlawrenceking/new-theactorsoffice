
<cftry>
    <cfset eventContactsService = createObject("component", "services.EventContactsXRefService")>
    <cfset finall = eventContactsService.SELeventcontactsxref_23738(eventId=eventresults.eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in finall_20_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
