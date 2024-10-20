
<cftry>
    <cfset eventService = new "/services/EventService.cfc"()>
    <cfset result = eventService.updateevents(
        eventTitle = eventTitle,
        eventTypeName = eventTypeName,
        eventDescription = eventDescription,
        eventLocation = eventLocation,
        eventStart = eventStart,
        eventStartTime = eventStartTime,
        dow = dow,
        new_eventStopTime = new_eventStopTime,
        endRecur = endRecur,
        eventid = eventid
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in update_18_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
