
<cftry>
    <cfset report_11 = createObject("component", "services.AuditionProjectService").SELaudprojects_24236(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_11_282_9.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
