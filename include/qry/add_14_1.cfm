
<cftry>
    <cfset result = createObject("component", "services.EventService").insertevents(
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
    <cfquery>
        UPDATE database SET isfetch = 1 WHERE ...
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in add_14_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
