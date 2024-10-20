
<cftry>
    <cfset durationService = new "/services/MeetingDurationService.cfc" />
    <cfset duration = durationService.getmtgdurations(new_durid) />
<cfcatch type="any">
    <cfset errorLog = "[Error in duration_467_1.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
