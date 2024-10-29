
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset eventService.insertEvent(
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
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_14_1.cfm] #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
