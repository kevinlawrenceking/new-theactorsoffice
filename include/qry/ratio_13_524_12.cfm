
<cftry>
    <cfset ratio_13 = createObject("component", "services.ReportUserService").getvm_reports_user_reportitems(session.userid, 13)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in ratio_13_524_12.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
