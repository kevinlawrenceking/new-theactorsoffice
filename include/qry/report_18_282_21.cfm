
<cftry>
    <cfset report_18 = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(
        new_audsourceid=new_audsourceid,
        userid=userid,
        rangestart=rangeselected.rangestart,
        rangeend=rangeselected.rangeend
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in report_18_282_21.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
