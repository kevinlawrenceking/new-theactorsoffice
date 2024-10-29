
<cftry>
    <cfset report_13 = createObject("component", "services.AuditionProjectService").getAuditionBookings(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_13_282_12.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
