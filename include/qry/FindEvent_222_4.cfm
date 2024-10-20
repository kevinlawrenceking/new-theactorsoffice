
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset FindEvent = eventService.getevents(new_eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindEvent_222_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
