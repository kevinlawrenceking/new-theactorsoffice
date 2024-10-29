
<cftry>
    <cfset eventService = createObject("component", "services.EventService")>
    <cfset eventService.updateEvent(
        new_eventid=new_eventid,
        eventStart=eventStart,
        eventStartTime=eventStartTime,
        eventStopTime=eventStopTime
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in FInd_374_2.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
