<cfset eventService = createObject("component", "services.EventService")>
<cfset isFollowup = eventService.SELevents(audprojectid=audprojectid)>

<Cfoutput>isFollowup: #isfollowup#<BR></cfoutput><cfabort>