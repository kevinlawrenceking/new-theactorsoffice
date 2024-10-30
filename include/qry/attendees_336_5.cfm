
<cftry>
    <cfset attendeesService = createObject("component", "services.EventContactsXRefService")>
    <cfset attendees = attendeesService.SELeventcontactsxref_24499(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in attendees_336_5.cfm]: #cfcatch.message#" type="error">
        <cfset attendees = queryNew("")>
    </cfcatch>
</cftry>
