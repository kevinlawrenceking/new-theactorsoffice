
<cftry>
    <cfset report_2 = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        userid = userid,
        new_audcatid = new_audcatid
    )>
<cfcatch>
    <cfset errorLog("[Error in report_2_282_24.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
