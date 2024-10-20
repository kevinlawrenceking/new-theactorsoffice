
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset y = eventService.getvm_events_audroles(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in y_191_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
