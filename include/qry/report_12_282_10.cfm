
<cftry>
    <cfset report_12 = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in report_12_282_10.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
