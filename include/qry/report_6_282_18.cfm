
<cftry>
    <cfset report_6 = createObject("component", "services.AuditionProjectService").SELaudprojects_24245(
        rangeStart = rangeselected.rangestart,
        rangeEnd = rangeselected.rangeend,
        userId = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in report_6_282_18.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
