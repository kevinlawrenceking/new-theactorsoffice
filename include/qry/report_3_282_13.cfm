
<cftry>
    <cfset report_3 = createObject("component", "services.AuditionProjectService").getvm_audprojects_roles_events(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
<cfcatch>
    <cfset errorLog = "[Error in report_3_282_13.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
