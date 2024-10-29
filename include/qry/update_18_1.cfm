
<cftry>
    <cfset variables.eventService = createObject("component", "services.EventService")>
    <cfset variables.eventService.updateEvent(
        eventTitle = eventTitle,
        eventTypeName = eventTypeName,
        eventDescription = eventDescription,
        eventLocation = eventLocation,
        eventStart = eventStart,
        eventStartTime = eventStartTime,
        dow = dow,
        eventStopTime = new_eventStopTime,
        endRecur = endRecur,
        eventid = eventid
    )>
<cfcatch>
    <cflog file="errorLog" text="[Error in update_18_1.cfm] Failed to update event. Event ID: #eventid#. Error: #cfcatch.message#" type="error">
</cfcatch>
</cftry>
