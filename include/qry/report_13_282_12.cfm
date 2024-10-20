
<cftry>
    <cfset report_13 = createObject("component", "services.AuditionProjectService").getvm_audprojects_roles_events(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
<cfcatch>
    <cfset errorLog = "[Error in report_13_282_12.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
