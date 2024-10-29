
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset find_events = eventService.getEvents(eventtypename=linkdetails.eventtypename, userid=linkdetails.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_events_309_2.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
