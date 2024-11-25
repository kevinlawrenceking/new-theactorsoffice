<cfset meetingDurationService = createObject("component", "services.MeetingDurationService") />
<Cfif eventdetails.new_hours = "">
    <cfset new_durhours = 1 />
<Cfelse>
<cfset new_durhours = eventdetails.new_hours />
</cfif>

<cfset findd = meetingDurationService.SELmtgdurations_24493(new_durhours=eventdetails.new_durhours) />