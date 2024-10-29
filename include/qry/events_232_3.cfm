
<cftry>
    <cfset eventsService = new "/services/EventService.cfc"()>
    <cfset events = eventsService.getEventIdsByAudRoleId(audroleid=audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_232_3.cfm]: #cfcatch.message#">
        <cfset events = queryNew("eventid")>
    </cfcatch>
</cftry>
