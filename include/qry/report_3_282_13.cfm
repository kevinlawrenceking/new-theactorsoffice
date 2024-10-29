
<cftry>
    <cfset report_3 = createObject("component", "services.AuditionProjectService").getAuditionData(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_3_282_13.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
