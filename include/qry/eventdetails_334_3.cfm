
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset eventdetails = eventService.getEventById(eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in eventdetails_334_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
