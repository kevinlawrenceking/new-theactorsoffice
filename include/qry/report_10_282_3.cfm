
<cftry>
    <cfset report_10 = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events({
        userid: userid,
        new_rangestart: new_rangestart,
        new_rangeend: new_rangeend
    })>
<cfcatch>
    <cfset errorLog = "[Error in report_10_282_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
