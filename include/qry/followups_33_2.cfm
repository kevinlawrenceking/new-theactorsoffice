<cfset eventService = createObject("component", "services.EventService")>
<cfset followups = eventService.SELevents(audprojectid=audprojectid)>