
<cftry>
    <cfset durationService = createObject("component", "services.MeetingDurationService")>
    <cfset duration = durationService.getMtgDurations(new_durid=new_durid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in duration_467_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
