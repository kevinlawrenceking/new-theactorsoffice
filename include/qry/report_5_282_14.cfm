
<cftry>
    <cfset report_5 = createObject("component", "services.AuditionProjectService").getvm_audprojects_roles_events(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend
    )>
<cfcatch>
    <cfset errorLog = "[Error in report_5_282_14.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
