
<cftry>
    <cfset meetingDurationService = new "/services/MeetingDurationService.cfc"()>
    <cfset findd = meetingDurationService.getmtgdurations(new_durhours)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findd_221_10.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
