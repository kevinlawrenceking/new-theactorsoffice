<cfset eventService = createObject("component", "services.EventService")>
<cfset results = eventService.RESevents(audroleid=audroleid, eventid=eventid)>