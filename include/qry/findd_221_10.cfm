
<cfoutput><h2>dur hours: #new_durhours# </h2></cfoutput><cfabort>
<cfset meetingDurationService = createObject("component", "services.MeetingDurationService")>
<cfset findd = meetingDurationService.SELmtgdurations(new_durhours=new_durhours)>