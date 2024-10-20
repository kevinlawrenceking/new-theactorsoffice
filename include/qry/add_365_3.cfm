
<cftry>
    <cfset result = createObject("component", "services.EventService").insertevents(
        eventTitle = new_projname,
        eventTypeName = "Audition",
        eventDescription = new_projDescription,
        eventLocation = eventLocation,
        eventStart = (eventStart neq "") ? eventStart : "",
        eventStartTime = (eventStartTime neq "") ? eventStartTime : "",
        eventStopTime = (eventStopTime neq "") ? eventStopTime : "",
        userid = cookie.userid,
        eventid = new_eventid
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in add_365_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
