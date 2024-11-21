<cfset meetingDurationService = createObject("component", "services.MeetingDurationService") />

durhours<Cfoutput>#eventdetails.new_durhours#</cfoutput><Cfabort>
<cfset findd = meetingDurationService.SELmtgdurations_24493(new_durhours=eventdetails.new_durhours) />