
<cftry>
    <cfset report_9 = createObject("component", "/services/AuditionProjectService").getAuditionData(
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_9_282_23.cfm]: #cfcatch.message#;">
    </cfcatch>
</cftry>
