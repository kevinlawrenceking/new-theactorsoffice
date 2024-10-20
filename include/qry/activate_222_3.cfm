
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset activate = eventService.updateevents(new_eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in activate_222_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
