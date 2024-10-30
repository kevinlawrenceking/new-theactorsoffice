
<cftry>
    <cfset variables.eventService = createObject("component", "services.EventService")>
    <cfset variables.eventService.UPDevents_24108(
        eventId = findEvent.eventid,
        newEventStart = new_eventStart,
        newEventStartTime = new_eventStartTime,
        newEventStopTime = new_eventStopTime
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in updateEvent_222_7.cfm] #cfcatch.message#">
        <cfthrow message="Error updating event." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
