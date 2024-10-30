
<cftry>
    <cfset durations = createObject("component", "services.MeetingDurationService").SELmtgdurations_24656()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in durations_468_1.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
