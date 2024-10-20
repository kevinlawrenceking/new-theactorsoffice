
<cftry>
    <cfset meetingDurationService = new "/services/MeetingDurationService.cfc"()>
    <cfset findd = meetingDurationService.getmtgdurations(eventdetails.new_durhours)>
<cfcatch type="any">
    <cfset errorLog = "[Error in findd_335_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
