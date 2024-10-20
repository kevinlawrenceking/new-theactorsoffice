
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset result = eventService.updateevents(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in del_230_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
