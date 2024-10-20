
<cftry>
    <cfset report_7 = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(
        userid = userid,
        rangestart = rangeselected.rangestart,
        rangeend = rangeselected.rangeend,
        new_audcatid = new_audcatid
    )>
<cfcatch>
    <cfset errorLog("[Error in report_7_282_20.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
