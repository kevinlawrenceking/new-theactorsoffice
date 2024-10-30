
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset eventService.UPDevents_24530(eventStartTime="01:00:00")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tt_365_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
