<cfset eventService = createObject("component", "services.EventService")>
<cfset isFollowup = eventService.SELevents(audprojectid=audprojectid)>

