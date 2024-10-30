
<cftry>
    <cfset report_12 = createObject("component", "services.AuditionProjectService").SELaudprojects_24237(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_12_282_10.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
