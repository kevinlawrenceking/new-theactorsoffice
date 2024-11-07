<cfset eventService = createObject("component", "services.EventService")>

<cfset result = eventService.INSevents(
    eventTitle = eventTitle,
    eventTypeName = eventTypeName,
    eventDescription = eventDescription,
    eventLocation = eventLocation,
    eventStart = eventStart,
    eventStartTime = eventStartTime,
    new_eventStopTime = new_eventStopTime,
    dow = dow,
    endRecur = endRecur,
    userid = userid
) />
