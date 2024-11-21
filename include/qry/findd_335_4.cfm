<cfset meetingDurationService = createObject("component", "services.MeetingDurationService") />


<cfset findd = meetingDurationService.SELmtgdurations_24493(new_durhours=eventdetails.new_durhours) />