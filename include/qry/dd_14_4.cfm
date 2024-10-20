
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset eventService.updateevents()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in dd_14_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
