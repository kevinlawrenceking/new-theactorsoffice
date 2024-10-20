
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset details = eventService.getevents(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_229_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
