
<cftry>
    <cfset findid = createObject("component", "/services/ReportUserService").getreports_user(userid, new_reportid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findid_282_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
