<cftry>
    <!--- Instantiate the EventService component correctly --->
    <cfset variables.eventService = createObject("component", "services.EventService")>

    <!--- Call the INSevents method with the necessary parameters --->
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

 

<cfcatch type="any">
    <!--- Log any errors encountered --->
    <cflog file="errorLog" text="[Error in add_14_1.cfm] #cfcatch.message#" type="error">
</cfcatch>
</cftry>
