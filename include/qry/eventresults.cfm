<cfset eventService = createObject("component", "services.eventservice")>
<cfset eventresults = eventService.eventresults(userid=session.userid, currentid=currentid)>
