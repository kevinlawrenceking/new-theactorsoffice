
<cftry>
    <cfset variables.eventService = createObject("component", "/services/EventService")>
    <cfset variables.result = variables.eventService.updateevents(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in del2_230_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
