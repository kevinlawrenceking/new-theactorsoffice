
<cftry>
    <cfset findid = createObject("component", "/services/ReportUserService").getreports_user(session.userid, new_reportid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findid_146_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
