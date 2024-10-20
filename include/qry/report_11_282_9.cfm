
<cftry>
    <cfset report_11 = createObject("component", "services.AuditionProjectService").getvm_audprojects_roles_events(
        userID=userid, 
        rangeStart=rangeselected.rangestart, 
        rangeEnd=rangeselected.rangeend
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in report_11_282_9.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
