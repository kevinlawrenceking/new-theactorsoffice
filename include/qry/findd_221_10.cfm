
<cftry>
    <cfset findd = createObject("component", "/services/MeetingDurationService").getDurationsByHours(new_durhours=new_durhours)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findd_221_10.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
