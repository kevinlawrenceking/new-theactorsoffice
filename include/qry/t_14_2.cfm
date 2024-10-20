
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset eventService.updateevents()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in t_14_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
