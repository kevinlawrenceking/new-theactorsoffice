
<cftry>
    <cfset variables.eventService = new "/services/EventService.cfc"()>
    <cfset variables.result = variables.eventService.INSevents(
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
    <!--- Update the database to set isfetch = 1 --->
    <!--- Example: <cfquery>UPDATE some_table SET isfetch = 1 WHERE condition</cfquery> --->
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in add_14_1.cfm] #cfcatch.message#" type="error">
</cfcatch>
</cftry>
