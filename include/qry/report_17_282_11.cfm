
<cftry>
    <cfset report_17 = createObject("component", "services.AuditionProjectService").SELaudprojects_24238(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_17_282_11.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
