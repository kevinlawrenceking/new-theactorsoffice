
<cftry>
    <cfset eventService = createObject("component", "/services/EventService")>
    <cfset eventService.insertEvent(
        new_projname = new_projname,
        new_projDescription = new_projDescription,
        eventLocation = eventLocation,
        eventStart = eventStart,
        eventStartTime = eventStartTime,
        eventStopTime = eventStopTime,
        userid = cookie.userid,
        new_eventid = new_eventid
    )>
    <cflog file="application.log" text="Event inserted successfully." type="information">
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in add_365_3.cfm] #cfcatch.message#" type="error">
</cfcatch>
</cftry>
