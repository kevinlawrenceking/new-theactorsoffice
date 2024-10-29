
<cftry>
    <cfset durations = createObject("component", "services.MeetingDurationService").getMtgDurations()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in durations_468_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
