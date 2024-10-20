
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset find_events = eventService.getevents(linkdetails.eventtypename, linkdetails.userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in find_events_309_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
