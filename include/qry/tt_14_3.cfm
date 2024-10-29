
<cftry>
    <cfset eventService = new "/services/EventService.cfc" />
    <cfset eventService.updateEventStopTime(eventStartTime=now()) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tt_14_3.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
