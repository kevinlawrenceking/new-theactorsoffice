
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset eventdetails = eventService.DETevents_24492(eventid=eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in eventdetails_335_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
