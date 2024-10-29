
<cftry>
    <cfset findd = createObject("component", "services.MeetingDurationService").getDurationsByHours(new_durhours=eventdetails.new_durhours) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findd_335_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
