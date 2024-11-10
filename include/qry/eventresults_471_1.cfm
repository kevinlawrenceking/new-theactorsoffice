<cfset eventService = createObject("component", "services.EventService")>
<cfset eventresults = eventService.RESevents_24660(
    userID = userid,
    currentID = isDefined("currentid") ? currentid : 0
)>