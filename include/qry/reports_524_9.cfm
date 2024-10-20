
<cftry>
    <cfset reports = createObject("component", "/services/ReportUserService").getvm_reports_user_reportitems(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in reports_524_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
