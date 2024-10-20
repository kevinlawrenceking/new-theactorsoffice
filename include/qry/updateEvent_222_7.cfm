
<cftry>
    <cfset eventService = new "/services/EventService.cfc" />
    <cfset result = eventService.updateevents(
        eventid = findEvent.eventid,
        new_eventStart = new_eventStart,
        new_eventStartTime = new_eventStartTime,
        new_eventStopTime = new_eventStopTime
    ) />
    <cfset isfetch = 1 />
    <cfcatch type="any">
        <cfset errorLog = "[Error in updateEvent_222_7.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
