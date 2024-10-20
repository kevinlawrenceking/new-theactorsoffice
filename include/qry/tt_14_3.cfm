
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset result = eventService.updateevents()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in tt_14_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
