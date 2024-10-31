
<cftry>
    <cfset attendeesService = createObject("component", "/services/EventContactsXRefService")>
    <cfset attendees = attendeesService.SELeventcontactsxref_24489(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in attendees_334_5.cfm]: #cfcatch.message#">
        <cfset attendees = queryNew("")>
    </cfcatch>
</cftry>
