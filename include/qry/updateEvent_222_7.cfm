
<cftry>
    <cfset var eventService = createObject("component", "services.EventService")>
    <cfset eventService.UPDevents_24108(
        eventId = findEvent.eventid,
        newEventStart = new_eventStart,
        newEventStartTime = new_eventStartTime,
        newEventStopTime = new_eventStopTime
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in updateEvent_222_7.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
