
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset result = eventService.updateevents(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in delete_15_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
