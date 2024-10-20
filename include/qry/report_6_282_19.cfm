
<cftry>
    <cfset report_6 = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid
    )>
<cfcatch>
    <cfset errorLog = "[Error in report_6_282_19.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
