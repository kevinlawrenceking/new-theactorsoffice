
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset result = eventService.updateevents(recid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in deleteticket_100_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
