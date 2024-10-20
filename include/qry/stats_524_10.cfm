
<cftry>
    <cfset stats = createObject("component", "services.ReportUserService").getvm_reports_user_reportitems(session.userid, 4)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in stats_524_10.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
