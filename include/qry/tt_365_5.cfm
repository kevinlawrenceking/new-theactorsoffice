
<cftry>
    <cfset eventService = new "/services/EventService.cfc">
    <cfset eventService.updateevents()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in tt_365_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
