
<cftry>
    <cfset report_17 = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in report_17_282_11.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
