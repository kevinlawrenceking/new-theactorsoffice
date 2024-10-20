
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset eventService.updateevents(new_eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in del_232_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
