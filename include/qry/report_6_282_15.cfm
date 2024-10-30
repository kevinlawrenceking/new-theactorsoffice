
<cftry>
    <cfset report_6 = createObject("component", "/services/AuditionProjectService").SELaudprojects_24242(
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_6_282_15.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
