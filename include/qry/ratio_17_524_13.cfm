
<cftry>
    <cfset ratio_17 = createObject("component", "/services/ReportUserService").getvm_reports_user_reportitems(session.userid, 17)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in ratio_17_524_13.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
