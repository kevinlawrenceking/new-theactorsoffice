
<cftry>
    <cfset report_9 = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in report_9_282_23.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
